//
//  Vitamins.swift
//  Dietary
//
//  Created by Umang Chouhan on 11/10/25.
//

import Foundation
import JSONSchemaBuilder

// MARK: - Supporting Types

public enum Solubility: String, Codable {
    case waterSoluble
    case fatSoluble
}

@Schemable
public struct Amount: Codable, CustomStringConvertible {
    public let value: Double
    public let unit: String
    public var description: String { "\(value) \(unit)" }
    public init(_ value: Double, unit: String) {
        self.value = value
        self.unit = unit
    }
}

public enum DemographicGroup: String, CaseIterable, Codable {
    case infant
    case child
    case teenageMale
    case teenageFemale
    case adultMale
    case adultFemale
    case pregnantFemale
    case lactatingFemale
    case elderlyMale
    case elderlyFemale
}

// MARK: - Vitamin Protocol

public protocol Vitamin: Nutrient, CustomStringConvertible {
    var id: String { get }
    var type: VitaminType { get }
    var solubility: Solubility { get }
}

public extension Vitamin {
     var description: String {
        var parts: [String] = []
        parts.append("\(name) (\(id)) - \(solubility.rawValue)")
        if !dietarySourcesRanked.isEmpty {
            parts.append("Sources: \(dietarySourcesRanked.joined(separator: ", "))")
        }
        parts.append("RDA groups: \(recommendedDailyAllowances.count)")
        return parts.joined(separator: " | ")
    }
}

// MARK: - Vitamins

public struct VitaminA: Vitamin {
    public  let id = "A"
    public let type = VitaminType.vitaminA
    public  let name: String = "Vitamin A"
    public  let solubility: Solubility = .fatSoluble
    public  let dietarySourcesRanked = ["Liver", "Carrots", "Eggs", "Leafy greens"]
    public  let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(400, unit: "µg RAE"),
        .child: Amount(600, unit: "µg RAE"),
        .teenageMale: Amount(900, unit: "µg RAE"),
        .teenageFemale: Amount(700, unit: "µg RAE"),
        .adultMale: Amount(900, unit: "µg RAE"),
        .adultFemale: Amount(700, unit: "µg RAE"),
        .pregnantFemale: Amount(770, unit: "µg RAE"),
        .lactatingFemale: Amount(1300, unit: "µg RAE"),
        .elderlyMale: Amount(900, unit: "µg RAE"),
        .elderlyFemale: Amount(700, unit: "µg RAE")
    ]
}

public struct VitaminC: Vitamin {
    public  let id = "C"
    public let type = VitaminType.vitaminC
    public  let name = "Vitamin C"
    public  let solubility: Solubility = .waterSoluble
    public  let dietarySourcesRanked = ["Citrus fruits", "Berries", "Bell peppers"]
    public  let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(40, unit: "mg"),
        .child: Amount(45, unit: "mg"),
        .teenageMale: Amount(75, unit: "mg"),
        .teenageFemale: Amount(65, unit: "mg"),
        .adultMale: Amount(90, unit: "mg"),
        .adultFemale: Amount(75, unit: "mg"),
        .pregnantFemale: Amount(85, unit: "mg"),
        .lactatingFemale: Amount(120, unit: "mg"),
        .elderlyMale: Amount(90, unit: "mg"),
        .elderlyFemale: Amount(75, unit: "mg")
    ]
}

public struct VitaminD: Vitamin {
    public  let id = "D"
    public let type = VitaminType.vitaminD
    public  let name = "Vitamin D"
    public  let solubility: Solubility = .fatSoluble
    public  let dietarySourcesRanked = ["Sunlight", "Fatty fish", "Fortified milk"]
    public  let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(10, unit: "µg (400 IU)"),
        .child: Amount(15, unit: "µg (600 IU)"),
        .teenageMale: Amount(15, unit: "µg (600 IU)"),
        .teenageFemale: Amount(15, unit: "µg (600 IU)"),
        .adultMale: Amount(15, unit: "µg (600 IU)"),
        .adultFemale: Amount(15, unit: "µg (600 IU)"),
        .pregnantFemale: Amount(15, unit: "µg (600 IU)"),
        .lactatingFemale: Amount(15, unit: "µg (600 IU)"),
        .elderlyMale: Amount(20, unit: "µg (800 IU)"),
        .elderlyFemale: Amount(20, unit: "µg (800 IU)")
    ]
}

public struct VitaminE: Vitamin {
    public  let id = "E"
    public  let name = "Vitamin E"
    public let type = VitaminType.vitaminE
    public  let solubility: Solubility = .fatSoluble
    public  let dietarySourcesRanked = ["Nuts", "Seeds", "Vegetable oils"]
    public  let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(4, unit: "mg"),
        .child: Amount(7, unit: "mg"),
        .teenageMale: Amount(15, unit: "mg"),
        .teenageFemale: Amount(15, unit: "mg"),
        .adultMale: Amount(15, unit: "mg"),
        .adultFemale: Amount(15, unit: "mg"),
        .pregnantFemale: Amount(15, unit: "mg"),
        .lactatingFemale: Amount(19, unit: "mg"),
        .elderlyMale: Amount(15, unit: "mg"),
        .elderlyFemale: Amount(15, unit: "mg")
    ]
}

public struct VitaminK: Vitamin {
    public  let id = "K"
    public  let name = "Vitamin K"
    public let type = VitaminType.vitaminK
    public  let solubility: Solubility = .fatSoluble
    public  let dietarySourcesRanked = ["Leafy greens", "Vegetable oils"]
    public  let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(2, unit: "µg"),
        .child: Amount(30, unit: "µg"),
        .teenageMale: Amount(75, unit: "µg"),
        .teenageFemale: Amount(75, unit: "µg"),
        .adultMale: Amount(120, unit: "µg"),
        .adultFemale: Amount(90, unit: "µg"),
        .pregnantFemale: Amount(90, unit: "µg"),
        .lactatingFemale: Amount(90, unit: "µg"),
        .elderlyMale: Amount(120, unit: "µg"),
        .elderlyFemale: Amount(90, unit: "µg")
    ]
}
public struct VitaminB1: Vitamin {
    public let id = "vitamin_b1"
    public let type = VitaminType.B1
    public let name = "Vitamin B1"
    public let chemicalName = "Thiamine"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.3, unit: "mg"),
        .child: Amount(0.6, unit: "mg"),
        .teenageMale: Amount(1.2, unit: "mg"),
        .teenageFemale: Amount(1.0, unit: "mg"),
        .adultMale: Amount(1.2, unit: "mg"),
        .adultFemale: Amount(1.1, unit: "mg"),
        .pregnantFemale: Amount(1.4, unit: "mg"),
        .lactatingFemale: Amount(1.4, unit: "mg"),
        .elderlyMale: Amount(1.2, unit: "mg"),
        .elderlyFemale: Amount(1.1, unit: "mg")
    ]
}

public struct VitaminB2: Vitamin {
    public let id = "vitamin_b2"
    public let type = VitaminType.B2
    public let name = "Vitamin B2"
    public let chemicalName = "Riboflavin"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.4, unit: "mg"),
        .child: Amount(0.6, unit: "mg"),
        .teenageMale: Amount(1.3, unit: "mg"),
        .teenageFemale: Amount(1.0, unit: "mg"),
        .adultMale: Amount(1.3, unit: "mg"),
        .adultFemale: Amount(1.1, unit: "mg"),
        .pregnantFemale: Amount(1.4, unit: "mg"),
        .lactatingFemale: Amount(1.6, unit: "mg"),
        .elderlyMale: Amount(1.3, unit: "mg"),
        .elderlyFemale: Amount(1.1, unit: "mg")
    ]
}

public struct VitaminB3: Vitamin {
    public let id = "vitamin_b3"
    public let type = VitaminType.B3
    public let name = "Vitamin B3"
    public let chemicalName = "Niacin"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(2, unit: "mg"),
        .child: Amount(8, unit: "mg"),
        .teenageMale: Amount(16, unit: "mg"),
        .teenageFemale: Amount(14, unit: "mg"),
        .adultMale: Amount(16, unit: "mg"),
        .adultFemale: Amount(14, unit: "mg"),
        .pregnantFemale: Amount(18, unit: "mg"),
        .lactatingFemale: Amount(17, unit: "mg"),
        .elderlyMale: Amount(16, unit: "mg"),
        .elderlyFemale: Amount(14, unit: "mg")
    ]
}

public struct VitaminB5: Vitamin {
    public let id = "vitamin_b5"
    public let type = VitaminType.B5
    public let name = "Vitamin B5"
    public let chemicalName = "Pantothenic Acid"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(1.8, unit: "mg"),
        .child: Amount(3, unit: "mg"),
        .teenageMale: Amount(5, unit: "mg"),
        .teenageFemale: Amount(5, unit: "mg"),
        .adultMale: Amount(5, unit: "mg"),
        .adultFemale: Amount(5, unit: "mg"),
        .pregnantFemale: Amount(6, unit: "mg"),
        .lactatingFemale: Amount(7, unit: "mg"),
        .elderlyMale: Amount(5, unit: "mg"),
        .elderlyFemale: Amount(5, unit: "mg")
    ]
}

public struct VitaminB6: Vitamin {
    public let id = "vitamin_b6"
    public let type = VitaminType.B6
    public let name = "Vitamin B6"
    public let chemicalName = "Pyridoxine"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.3, unit: "mg"),
        .child: Amount(0.6, unit: "mg"),
        .teenageMale: Amount(1.3, unit: "mg"),
        .teenageFemale: Amount(1.2, unit: "mg"),
        .adultMale: Amount(1.3, unit: "mg"),
        .adultFemale: Amount(1.3, unit: "mg"),
        .pregnantFemale: Amount(1.9, unit: "mg"),
        .lactatingFemale: Amount(2.0, unit: "mg"),
        .elderlyMale: Amount(1.7, unit: "mg"),
        .elderlyFemale: Amount(1.5, unit: "mg")
    ]
}

public struct VitaminB7: Vitamin {
    public let id = "vitamin_b7"
    public let type = VitaminType.B7
    public let name = "Vitamin B7"
    public let chemicalName = "Biotin"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(5, unit: "µg"),
        .child: Amount(12, unit: "µg"),
        .teenageMale: Amount(25, unit: "µg"),
        .teenageFemale: Amount(25, unit: "µg"),
        .adultMale: Amount(30, unit: "µg"),
        .adultFemale: Amount(30, unit: "µg"),
        .pregnantFemale: Amount(30, unit: "µg"),
        .lactatingFemale: Amount(35, unit: "µg"),
        .elderlyMale: Amount(30, unit: "µg"),
        .elderlyFemale: Amount(30, unit: "µg")
    ]
}

public struct VitaminB9: Vitamin {
    public let id = "vitamin_b9"
    public let type = VitaminType.B9
    public let name = "Vitamin B9"
    public let chemicalName = "Folate (Folic Acid)"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(65, unit: "µg DFE"),
        .child: Amount(150, unit: "µg DFE"),
        .teenageMale: Amount(400, unit: "µg DFE"),
        .teenageFemale: Amount(400, unit: "µg DFE"),
        .adultMale: Amount(400, unit: "µg DFE"),
        .adultFemale: Amount(400, unit: "µg DFE"),
        .pregnantFemale: Amount(600, unit: "µg DFE"),
        .lactatingFemale: Amount(500, unit: "µg DFE"),
        .elderlyMale: Amount(400, unit: "µg DFE"),
        .elderlyFemale: Amount(400, unit: "µg DFE")
    ]
}

public struct VitaminB12: Vitamin {
    public let id = "vitamin_b12"
    public let type = VitaminType.B12
    public let name = "Vitamin B12"
    public let chemicalName = "Cobalamin"
    public let solubility = Solubility.waterSoluble
    public let dietarySourcesRanked: [String] = []

    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.4, unit: "µg"),
        .child: Amount(1.2, unit: "µg"),
        .teenageMale: Amount(2.4, unit: "µg"),
        .teenageFemale: Amount(2.4, unit: "µg"),
        .adultMale: Amount(2.4, unit: "µg"),
        .adultFemale: Amount(2.4, unit: "µg"),
        .pregnantFemale: Amount(2.6, unit: "µg"),
        .lactatingFemale: Amount(2.8, unit: "µg"),
        .elderlyMale: Amount(2.4, unit: "µg"),
        .elderlyFemale: Amount(2.4, unit: "µg")
    ]
}

public protocol VitaminUnitConvertible {
    var value: Double { get }
    var unit: VitaminUnit { get }
    func converted(to target: VitaminUnit) -> Amount
}

public enum VitaminUnit: String, Codable {
    case microgramRAE      // µg RAE
    case internationalUnit // IU
    case microgram         // µg
    case milligram         // mg
    
    /// Conversion ratios (for vitamin-specific mappings)
    func convert(value: Double, from source: VitaminUnit, vitamin: VitaminType) -> Double {
        switch vitamin {
        case .vitaminA:
            // Vitamin A conversions
            if source == .microgramRAE && self == .internationalUnit {
                return value * 3.33 // µg RAE → IU (retinol equivalent)
            } else if source == .internationalUnit && self == .microgramRAE {
                return value / 3.33
            }
        case .vitaminD:
            // Vitamin D conversions (1 µg = 40 IU)
            if source == .microgram && self == .internationalUnit {
                return value * 40
            } else if source == .internationalUnit && self == .microgram {
                return value / 40
            }
        default:
            break
        }
        return value // same unit or unsupported
    }
}

public enum VitaminType: String, Codable {
    case vitaminA
    case vitaminD
    case vitaminE
    case vitaminC
    case vitaminK
    case B1, B2, B3, B5, B6, B7, B9, B12
}

