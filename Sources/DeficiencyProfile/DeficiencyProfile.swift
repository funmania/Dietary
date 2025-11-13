//
//  DeficiencyProfile.swift
//  Dietary
//
//  Created by Umang Chouhan on 12/11/25.
//
import Foundation

// --- MODELS TO DEFINE DEFICIENCY LOGIC (Unchanged) ---

public enum DeficiencyRiskModel {
    case dailyTurnover(onsetWeeks: Int)
    case longTermStorage(depletionMonths: Int)
    case structural(depletionMonths: Int)
    case acuteRegulated(onsetDays: Int)
    case dailyEssential(onsetHours: Int)
    case adaptive
}

public struct DeficiencyProfile {
    let commonName: String
    let riskModel: DeficiencyRiskModel
    let keySymptoms: [String]
    let atRiskPopulations: [String]
}

// --- MODEL FOR ANALYSIS OUTPUT (Unchanged) ---

public struct PotentialDeficiencyWarning {
    public enum Severity: Int {
        case monitoring = 1
        case warning = 2
        case highRisk = 3
    }
    
    public let nutrient: NutrientType
    public let consecutiveDaysLow: Int
    public let message: String
    public let severity: Severity
    public let deficiencyProfile: DeficiencyProfile
}
