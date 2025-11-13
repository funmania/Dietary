import SwiftData
import Foundation

/// A thread-safe actor that analyzes and modifies nutrient data in a SwiftData database.
///
/// This actor is designed to be created once and shared, often by being
/// injected into the SwiftUI Environment. It safely creates its own
/// background `ModelContext` for all operations.
public actor NutrientAnalysisActor {
    
    private let modelContainer: ModelContainer
    private let userProfile: DemographicGroup
    
    public init(modelContainer: ModelContainer, userProfile: DemographicGroup) {
        self.modelContainer = modelContainer
        self.userProfile = userProfile
    }

    /// Normalizes a Date to the start of its day.
    private func startOfDay(for date: Date) -> Date {
        return Calendar.current.startOfDay(for: date)
    }
    
    /// Adds a food item to the database for a specific date.
    /// This method is async and can be safely called from any thread.
    public func addFood(_ item: FoodItem, for date: Date) {
        // 1. Create a new, private context for this background task.
        let context = ModelContext(modelContainer)
        
        let dayKey = startOfDay(for: date)
        
        // 2. Check if a DailyLog for this day already exists
        let predicate = #Predicate<DailyLog> { $0.date == dayKey }
        let fetchDescriptor = FetchDescriptor(predicate: predicate)
        
        let dailyLog: DailyLog
        
        if let existingLog = (try? context.fetch(fetchDescriptor))?.first {
            dailyLog = existingLog
        } else {
            // 3. If not, create a new one and insert it
            dailyLog = DailyLog(date: dayKey)
            context.insert(dailyLog)
        }
        
        // 4. Create the persistent FoodItemLog and link it to the DailyLog
        let foodLog = FoodItemLog(from: item)
        dailyLog.foodItems.append(foodLog)
        
        // 5. Save the changes on this background context
        do {
            try context.save()
        } catch {
            print("Error saving food item in actor: \(error.localizedDescription)")
        }
    }
    
    /// Deletes a specific `FoodItemLog` from the database.
    /// This method is async and can be safely called from any thread.
    public func deleteFood(with id: PersistentIdentifier) {
        let context = ModelContext(modelContainer)
        
        guard let foodLog = context.model(for: id) as? FoodItemLog else {
            print("Error: Could not find FoodItemLog with ID \(id) to delete.")
            return
        }
        
        // Perform database delete (safe on this background context)
        context.delete(foodLog)
        
        do {
            try context.save()
        } catch {
            print("Error deleting food item in actor: \(error.localizedDescription)")
        }
    }
    
    /// Deletes an entire `DailyLog` (and all its food items) from the database.
    /// This method is async and can be safely called from any thread.
    public func deleteLog(with id: PersistentIdentifier) {
        let context = ModelContext(modelContainer)
        
        guard let dailyLog = context.model(for: id) as? DailyLog else {
            print("Error: Could not find DailyLog with ID \(id) to delete.")
            return
        }
        
        // Perform database delete (safe on this background context)
        // FoodItemLogs will be cascade-deleted.
        context.delete(dailyLog)
        
        do {
            try context.save()
        } catch {
            print("Error deleting daily log in actor: \(error.localizedDescription)")
        }
    }
    
    /// Analyzes the database and returns all potential deficiency warnings.
    /// - Parameter assumesPriorDeficiency: If true, will "fast-track" warnings
    ///   for long-term nutrients based on a short, poor diet history.
    public func getPotentialDeficiencies(assumesPriorDeficiency: Bool = false) throws -> [PotentialDeficiencyWarning] {
        let context = ModelContext(modelContainer)
        
        var warnings: [PotentialDeficiencyWarning] = []

        let dateDescriptor = SortDescriptor(\DailyLog.date, order: .reverse)
        let fetchDescriptor = FetchDescriptor<DailyLog>(sortBy: [dateDescriptor])
        let sortedLogs = try context.fetch(fetchDescriptor)
        
        if sortedLogs.isEmpty { return [] }

        for nutrientType in NutrientType.allCases {
            let nutrient = nutrientType.nutrient
            guard let rda = nutrient.recommendedDailyAllowances[userProfile],
                  let profile = nutrient.deficiencyProfile else {
                continue
            }
            
            var consecutiveDaysLow = 0
            for log in sortedLogs {
                let dailyTotals = log.calculateTotals()
                let intake = dailyTotals[nutrientType] ?? Amount.zero
                
                if intake < rda {
                    consecutiveDaysLow += 1
                } else {
                    break // Streak is broken
                }
            }
            
            if consecutiveDaysLow == 0 {
                continue
            }

            if let warning = createWarning(
                for: nutrientType,
                profile: profile,
                consecutiveDaysLow: consecutiveDaysLow,
                assumesPriorDeficiency: assumesPriorDeficiency // Pass the flag down
            ) {
                warnings.append(warning)
            }
        }
        
        return warnings.sorted { $0.severity.rawValue > $1.severity.rawValue }
    }
    
    /// Private helper to generate a specific warning message and severity.
    private func createWarning(
        for nutrient: NutrientType,
        profile: DeficiencyProfile,
        consecutiveDaysLow: Int,
        assumesPriorDeficiency: Bool
    ) -> PotentialDeficiencyWarning? {
        
        var severity: PotentialDeficiencyWarning.Severity
        var message: String
        let days = consecutiveDaysLow
        
        switch profile.riskModel {
            
        case .dailyEssential(let onsetHours):
            let onsetDays = max(1, onsetHours / 24)
            if days >= onsetDays {
                severity = .highRisk
                message = "Intake has been critically low for \(days) day(s). Risk of \(profile.commonName) is imminent."
            } else { return nil }

        case .dailyTurnover(let onsetWeeks):
            let onsetDays = onsetWeeks * 7
            if days >= onsetDays {
                severity = .highRisk
                message = "Intake low for \(days) days, exceeding the \(onsetWeeks)-week onset time for \(profile.commonName)."
            } else if days > onsetDays / 2 {
                severity = .warning
                message = "Intake low for \(days) days. You are approaching the risk window for \(profile.commonName)."
            } else if days > 3 {
                severity = .monitoring
                message = "Intake low for \(days) days. Consistent intake is required to avoid deficiency."
            } else { return nil }

        case .longTermStorage(let depletionMonths):
            let depletionDays = depletionMonths * 30
            
            // --- "FAST-TRACK" LOGIC ---
            // If the toggle is ON and the user has at least a week of low intake,
            // create a monitoring warning immediately, bypassing the 30-day+ check.
            if assumesPriorDeficiency && days >= 7 && days < depletionDays / 2 {
                severity = .monitoring
                message = "Intake low for \(days) days. 'Fast-Track' warning: This diet may not be meeting long-term \(nutrient.nutrient.name) needs."
            }
            // --- STANDARD LOGIC ---
            else if days >= depletionDays {
                severity = .highRisk
                message = "Intake has been chronically low for \(days) days. Body stores may be depleted."
            } else if days > depletionDays / 2 {
                severity = .warning
                message = "Intake low for \(days) days. This is not sustainable and may be depleting body stores."
            } else if days > 30 {
                severity = .monitoring
                message = "Intake low for over a month. While you have stores, this is a long-term concern."
            } else {
                return nil // A few days of low Vit A is no problem
            }
        
        case .structural(let depletionMonths):
            let depletionDays = depletionMonths * 30
            
            // --- "FAST-TRACK" LOGIC ---
            if assumesPriorDeficiency && days >= 7 && days < depletionDays / 2 {
                severity = .monitoring
                message = "Intake low for \(days) days. 'Fast-Track' warning: This diet may not be meeting long-term needs for \(profile.commonName)."
            }
            // --- STANDARD LOGIC ---
            else if days > depletionDays / 2 {
                severity = .warning
                message = "Intake has been chronically low for \(days) days. Risk of \(profile.commonName)."
            } else if days > 60 {
                severity = .monitoring
                message = "Intake low for over 2 months. This can lead to long-term issues like \(profile.keySymptoms.first ?? "")."
            } else {
                return nil
            }
            
        case .acuteRegulated:
            if days > 3 {
                severity = .monitoring
                message = "Intake has been low for \(days) days. Body levels of \(nutrient.nutrient.name) are tightly regulated and have no buffer."
            } else { return nil }
            
        case .adaptive:
            return nil
        }
        
        return PotentialDeficiencyWarning(
            nutrient: nutrient,
            consecutiveDaysLow: consecutiveDaysLow,
            message: message,
            severity: severity,
            deficiencyProfile: profile
        )
    }
}
