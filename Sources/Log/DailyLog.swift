//
//  DailyLog.swift
//  Dietary
//
//  Created by Umang Chouhan on 12/11/25.
//

import SwiftData
import Foundation

// MARK: - SwiftData Database Models

@Model
public final class FoodItemLog {
    /// The common name of the food (e.g., "Apple", "Chicken Breast").
    public var name: String
    
    /// The serving size (stored as a Codable struct).
    public var servingSize: Amount
    
    /// A dictionary mapping each nutrient type to its amount (stored as Codable).
    public var nutrients: [NutrientType: Amount]
    
    /// The parent `DailyLog` this item belongs to.
    /// This is the "inverse" side of the relationship.
    @Relationship(inverse: \DailyLog.foodItems)
    public var dailyLog: DailyLog?

    public init(name: String, servingSize: Amount, nutrients: [NutrientType: Amount]) {
        self.name = name
        self.servingSize = servingSize
        self.nutrients = nutrients
    }
    
    /// Creates a persistent `FoodItemLog` from a transient `FoodItem` struct.
    public convenience init(from item: FoodItem) {
        self.init(name: item.name, servingSize: item.servingSize, nutrients: item.nutrients)
    }
}

@Model
public final class DailyLog {
    /// A unique, normalized Date (start of day). This is our primary key.
    @Attribute(.unique)
    public var date: Date
    
    /// All food items logged for this day.
    /// `.cascade` means if this DailyLog is deleted, all its FoodItemLogs are also deleted.
    @Relationship(deleteRule: .cascade)
    public var foodItems: [FoodItemLog] = []

    public init(date: Date) {
        // Ensure the date is always normalized to the start of the day
        self.date = Calendar.current.startOfDay(for: date)
    }
    
    /// Calculates the total nutrient intake for this specific day.
    /// This logic is moved from the old tracker.
    public func calculateTotals() -> [NutrientType: Amount] {
        var dailyTotals: [NutrientType: Amount] = [:]
        
        for item in foodItems {
            for (nutrientType, amount) in item.nutrients {
                let zeroAmount = Amount(value: 0, unit: amount.unit)
                dailyTotals[nutrientType, default: zeroAmount] += amount
            }
        }
        return dailyTotals
    }
}
