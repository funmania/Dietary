//
//  MacroNutrients.swift
//  Dietary
//
//  Created by Umang Chouhan on 18/10/25.
//

import Foundation

public protocol Macronutrient: Nutrient {}

public struct Carbohydrates: Macronutrient {
    public let name = "Carbohydrates"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(60, unit: "g"),
        .child: Amount(130, unit: "g"),
        .teenageMale: Amount(130, unit: "g"),
        .teenageFemale: Amount(130, unit: "g"),
        .adultMale: Amount(130, unit: "g"),
        .adultFemale: Amount(130, unit: "g"),
        .pregnantFemale: Amount(175, unit: "g"),
        .lactatingFemale: Amount(210, unit: "g"),
        .elderlyMale: Amount(130, unit: "g"),
        .elderlyFemale: Amount(130, unit: "g")
    ]
    public let dietarySourcesRanked: [String] = [
        "Whole grains", "Rice", "Wheat", "Oats", "Potatoes", "Fruits", "Legumes"
    ]
}

public struct Proteins: Macronutrient {
    public let name = "Proteins"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(9, unit: "g"),
        .child: Amount(19, unit: "g"),
        .teenageMale: Amount(52, unit: "g"),
        .teenageFemale: Amount(46, unit: "g"),
        .adultMale: Amount(56, unit: "g"),
        .adultFemale: Amount(46, unit: "g"),
        .pregnantFemale: Amount(71, unit: "g"),
        .lactatingFemale: Amount(71, unit: "g"),
        .elderlyMale: Amount(56, unit: "g"),
        .elderlyFemale: Amount(46, unit: "g")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Fish", "Eggs", "Dairy", "Soy products", "Legumes", "Nuts", "Seeds"
    ]
}

public struct Fats: Macronutrient {
    public let name = "Total Fat"

    // Total fat RDA per demographic
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(31, unit: "g"),
        .child: Amount(25, unit: "g"),
        .teenageMale: Amount(70, unit: "g"),
        .teenageFemale: Amount(70, unit: "g"),
        .adultMale: Amount(70, unit: "g"),
        .adultFemale: Amount(70, unit: "g"),
        .pregnantFemale: Amount(70, unit: "g"),
        .lactatingFemale: Amount(70, unit: "g"),
        .elderlyMale: Amount(70, unit: "g"),
        .elderlyFemale: Amount(70, unit: "g")
    ]

    public let dietarySourcesRanked: [String] = [
        "Olive oil", "Nuts", "Seeds", "Avocado", "Fatty fish", "Butter", "Cheese"
    ]

    // Fat subtypes RDA/AI per day (approximate ranges)
    public let saturatedFat: Amount = Amount(20, unit: "g") // limit <10% calories
    public let monounsaturatedFat: Amount = Amount(25, unit: "g") // beneficial
    public let polyunsaturatedFat: Amount = Amount(20, unit: "g") // includes omega-3/6
    public let transFat: Amount = Amount(0, unit: "g") // avoid completely
    public let omega3: Amount = Amount(1.6, unit: "g") // adult male
    public let omega6: Amount = Amount(17, unit: "g") // adult male
}

public struct Water: Macronutrient {
    public let name = "Water"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.7, unit: "L"),
        .child: Amount(1.3, unit: "L"),
        .teenageMale: Amount(3.3, unit: "L"),
        .teenageFemale: Amount(2.3, unit: "L"),
        .adultMale: Amount(3.7, unit: "L"),
        .adultFemale: Amount(2.7, unit: "L"),
        .pregnantFemale: Amount(3.0, unit: "L"),
        .lactatingFemale: Amount(3.8, unit: "L"),
        .elderlyMale: Amount(3.7, unit: "L"),
        .elderlyFemale: Amount(2.7, unit: "L")
    ]
    public let dietarySourcesRanked: [String] = [
        "Water", "Beverages", "Fruits", "Vegetables"
    ]
}

public struct Fiber: Macronutrient {
    public let name = "Fiber"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0, unit: "g"), // infants generally get minimal fiber
        .child: Amount(19, unit: "g"),
        .teenageMale: Amount(38, unit: "g"),
        .teenageFemale: Amount(26, unit: "g"),
        .adultMale: Amount(38, unit: "g"),
        .adultFemale: Amount(25, unit: "g"),
        .pregnantFemale: Amount(28, unit: "g"),
        .lactatingFemale: Amount(29, unit: "g"),
        .elderlyMale: Amount(30, unit: "g"),
        .elderlyFemale: Amount(21, unit: "g")
    ]
    public let dietarySourcesRanked: [String] = [
        "Whole grains", "Fruits", "Vegetables", "Legumes", "Nuts", "Seeds"
    ]
}

public enum MacronutrientType: String, CaseIterable {
    case carbohydrates, proteins, fats, water, fiber

    public var macronutrient: Macronutrient {
        switch self {
        case .carbohydrates: return Carbohydrates()
        case .proteins: return Proteins()
        case .fats: return Fats()
        case .water: return Water()
        case .fiber: return Fiber()
        }
    }
}

public protocol EssentialAminoAcid: Macronutrient {}

public struct Histidine: EssentialAminoAcid {
    public let name = "Histidine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(35, unit: "mg/kg"),
        .child: Amount(10, unit: "mg/kg"),
        .teenageMale: Amount(10, unit: "mg/kg"),
        .teenageFemale: Amount(10, unit: "mg/kg"),
        .adultMale: Amount(10, unit: "mg/kg"),
        .adultFemale: Amount(10, unit: "mg/kg"),
        .pregnantFemale: Amount(10, unit: "mg/kg"),
        .lactatingFemale: Amount(10, unit: "mg/kg"),
        .elderlyMale: Amount(10, unit: "mg/kg"),
        .elderlyFemale: Amount(10, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Fish", "Poultry", "Dairy", "Soy", "Legumes"
    ]
}

public struct Isoleucine: EssentialAminoAcid {
    public let name = "Isoleucine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(64, unit: "mg/kg"),
        .child: Amount(20, unit: "mg/kg"),
        .teenageMale: Amount(20, unit: "mg/kg"),
        .teenageFemale: Amount(20, unit: "mg/kg"),
        .adultMale: Amount(20, unit: "mg/kg"),
        .adultFemale: Amount(20, unit: "mg/kg"),
        .pregnantFemale: Amount(20, unit: "mg/kg"),
        .lactatingFemale: Amount(20, unit: "mg/kg"),
        .elderlyMale: Amount(20, unit: "mg/kg"),
        .elderlyFemale: Amount(20, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Eggs", "Dairy", "Soy", "Legumes", "Nuts"
    ]
}

public struct Leucine: EssentialAminoAcid {
    public let name = "Leucine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(140, unit: "mg/kg"),
        .child: Amount(42, unit: "mg/kg"),
        .teenageMale: Amount(42, unit: "mg/kg"),
        .teenageFemale: Amount(42, unit: "mg/kg"),
        .adultMale: Amount(42, unit: "mg/kg"),
        .adultFemale: Amount(42, unit: "mg/kg"),
        .pregnantFemale: Amount(42, unit: "mg/kg"),
        .lactatingFemale: Amount(42, unit: "mg/kg"),
        .elderlyMale: Amount(42, unit: "mg/kg"),
        .elderlyFemale: Amount(42, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Eggs", "Dairy", "Soy", "Legumes", "Whey Protein"
    ]
}

public struct Lysine: EssentialAminoAcid {
    public let name = "Lysine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(103, unit: "mg/kg"),
        .child: Amount(45, unit: "mg/kg"),
        .teenageMale: Amount(38, unit: "mg/kg"),
        .teenageFemale: Amount(38, unit: "mg/kg"),
        .adultMale: Amount(38, unit: "mg/kg"),
        .adultFemale: Amount(38, unit: "mg/kg"),
        .pregnantFemale: Amount(38, unit: "mg/kg"),
        .lactatingFemale: Amount(38, unit: "mg/kg"),
        .elderlyMale: Amount(38, unit: "mg/kg"),
        .elderlyFemale: Amount(38, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Fish", "Eggs", "Dairy", "Soy", "Quinoa"
    ]
}

public struct Methionine: EssentialAminoAcid {
    public let name = "Methionine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(33, unit: "mg/kg"),
        .child: Amount(13, unit: "mg/kg"),
        .teenageMale: Amount(13, unit: "mg/kg"),
        .teenageFemale: Amount(13, unit: "mg/kg"),
        .adultMale: Amount(13, unit: "mg/kg"),
        .adultFemale: Amount(13, unit: "mg/kg"),
        .pregnantFemale: Amount(13, unit: "mg/kg"),
        .lactatingFemale: Amount(13, unit: "mg/kg"),
        .elderlyMale: Amount(13, unit: "mg/kg"),
        .elderlyFemale: Amount(13, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Eggs", "Dairy", "Fish", "Soy", "Seeds"
    ]
}

public struct Phenylalanine: EssentialAminoAcid {
    public let name = "Phenylalanine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(46, unit: "mg/kg"),
        .child: Amount(25, unit: "mg/kg"),
        .teenageMale: Amount(25, unit: "mg/kg"),
        .teenageFemale: Amount(25, unit: "mg/kg"),
        .adultMale: Amount(25, unit: "mg/kg"),
        .adultFemale: Amount(25, unit: "mg/kg"),
        .pregnantFemale: Amount(25, unit: "mg/kg"),
        .lactatingFemale: Amount(25, unit: "mg/kg"),
        .elderlyMale: Amount(25, unit: "mg/kg"),
        .elderlyFemale: Amount(25, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Eggs", "Dairy", "Soy", "Legumes", "Nuts"
    ]
}

public struct Threonine: EssentialAminoAcid {
    public let name = "Threonine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(39, unit: "mg/kg"),
        .child: Amount(20, unit: "mg/kg"),
        .teenageMale: Amount(20, unit: "mg/kg"),
        .teenageFemale: Amount(20, unit: "mg/kg"),
        .adultMale: Amount(20, unit: "mg/kg"),
        .adultFemale: Amount(20, unit: "mg/kg"),
        .pregnantFemale: Amount(20, unit: "mg/kg"),
        .lactatingFemale: Amount(20, unit: "mg/kg"),
        .elderlyMale: Amount(20, unit: "mg/kg"),
        .elderlyFemale: Amount(20, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Eggs", "Dairy", "Soy", "Legumes", "Seeds"
    ]
}

public struct Tryptophan: EssentialAminoAcid {
    public let name = "Tryptophan"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(11, unit: "mg/kg"),
        .child: Amount(4, unit: "mg/kg"),
        .teenageMale: Amount(4, unit: "mg/kg"),
        .teenageFemale: Amount(4, unit: "mg/kg"),
        .adultMale: Amount(4, unit: "mg/kg"),
        .adultFemale: Amount(4, unit: "mg/kg"),
        .pregnantFemale: Amount(4, unit: "mg/kg"),
        .lactatingFemale: Amount(4, unit: "mg/kg"),
        .elderlyMale: Amount(4, unit: "mg/kg"),
        .elderlyFemale: Amount(4, unit: "mg/kg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Eggs", "Dairy", "Soy", "Nuts", "Seeds"
    ]
}

public struct Valine: EssentialAminoAcid {
    
    /// The common name of the amino acid.
    public let name = "Valine"
    
    /// Recommended Daily Allowances (RDA) for Valine,
    /// based on mg per kg of body weight.
    /// Values are simplified based on adult and infant needs.
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(55, unit: "mg/kg"),
        .child: Amount(26, unit: "mg/kg"),
        .teenageMale: Amount(26, unit: "mg/kg"),
        .teenageFemale: Amount(26, unit: "mg/kg"),
        .adultMale: Amount(26, unit: "mg/kg"),
        .adultFemale: Amount(26, unit: "mg/kg"),
        .pregnantFemale: Amount(26, unit: "mg/kg"),
        .lactatingFemale: Amount(26, unit: "mg/kg"),
        .elderlyMale: Amount(26, unit: "mg/kg"),
        .elderlyFemale: Amount(26, unit: "mg/kg")
    ]
    
    /// A ranked list of common dietary sources for Valine.
    public let dietarySourcesRanked: [String] = [
        "Meat", "Poultry", "Fish", "Dairy", "Eggs", "Soy", "Legumes", "Nuts"
    ]
}
