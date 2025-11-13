//
//  Minerals.swift
//  Dietary
//
//  Created by Umang Chouhan on 18/10/25.
//

import Foundation

public protocol Mineral: Nutrient {}

public struct Calcium: Mineral {
    public let name = "Calcium"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(200, unit: "mg"),
        .child: Amount(700, unit: "mg"),
        .teenageMale: Amount(1300, unit: "mg"),
        .teenageFemale: Amount(1300, unit: "mg"),
        .adultMale: Amount(1000, unit: "mg"),
        .adultFemale: Amount(1000, unit: "mg"),
        .pregnantFemale: Amount(1000, unit: "mg"),
        .lactatingFemale: Amount(1000, unit: "mg"),
        .elderlyMale: Amount(1200, unit: "mg"),
        .elderlyFemale: Amount(1200, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Cheese", "Yogurt", "Milk", "Sardines with bones", "Spinach", "Tofu", "Fortified plant milk", "Almonds"
    ]
}

public struct Magnesium: Mineral {
    public let name = "Magnesium"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(30, unit: "mg"),
        .child: Amount(130, unit: "mg"),
        .teenageMale: Amount(410, unit: "mg"),
        .teenageFemale: Amount(360, unit: "mg"),
        .adultMale: Amount(420, unit: "mg"),
        .adultFemale: Amount(320, unit: "mg"),
        .pregnantFemale: Amount(350, unit: "mg"),
        .lactatingFemale: Amount(310, unit: "mg"),
        .elderlyMale: Amount(420, unit: "mg"),
        .elderlyFemale: Amount(320, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Pumpkin seeds", "Almonds", "Spinach", "Cashews", "Black beans", "Dark chocolate", "Avocado"
    ]
}

public struct Phosphorus: Mineral {
    public let name = "Phosphorus"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(100, unit: "mg"),
        .child: Amount(460, unit: "mg"),
        .teenageMale: Amount(1250, unit: "mg"),
        .teenageFemale: Amount(1250, unit: "mg"),
        .adultMale: Amount(700, unit: "mg"),
        .adultFemale: Amount(700, unit: "mg"),
        .pregnantFemale: Amount(700, unit: "mg"),
        .lactatingFemale: Amount(700, unit: "mg"),
        .elderlyMale: Amount(700, unit: "mg"),
        .elderlyFemale: Amount(700, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Meat", "Fish", "Dairy products", "Eggs", "Nuts", "Legumes", "Whole grains"
    ]
}

public struct Potassium: Mineral {
    public let name = "Potassium"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(400, unit: "mg"),
        .child: Amount(3000, unit: "mg"),
        .teenageMale: Amount(4700, unit: "mg"),
        .teenageFemale: Amount(4700, unit: "mg"),
        .adultMale: Amount(4700, unit: "mg"),
        .adultFemale: Amount(4700, unit: "mg"),
        .pregnantFemale: Amount(4700, unit: "mg"),
        .lactatingFemale: Amount(5100, unit: "mg"),
        .elderlyMale: Amount(4700, unit: "mg"),
        .elderlyFemale: Amount(4700, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Potatoes", "Bananas", "Spinach", "Beans", "Avocado", "Tomatoes", "Orange juice"
    ]
}

public struct Sodium: Mineral {
    public let name = "Sodium"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(120, unit: "mg"),
        .child: Amount(1000, unit: "mg"),
        .teenageMale: Amount(1500, unit: "mg"),
        .teenageFemale: Amount(1500, unit: "mg"),
        .adultMale: Amount(1500, unit: "mg"),
        .adultFemale: Amount(1500, unit: "mg"),
        .pregnantFemale: Amount(1500, unit: "mg"),
        .lactatingFemale: Amount(1500, unit: "mg"),
        .elderlyMale: Amount(1500, unit: "mg"),
        .elderlyFemale: Amount(1500, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Table salt", "Processed foods", "Soy sauce", "Cured meats", "Cheese"
    ]
}

public struct Chloride: Mineral {
    public let name = "Chloride"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.5, unit: "g"),
        .child: Amount(1.5, unit: "g"),
        .teenageMale: Amount(2.3, unit: "g"),
        .teenageFemale: Amount(2.3, unit: "g"),
        .adultMale: Amount(2.3, unit: "g"),
        .adultFemale: Amount(2.3, unit: "g"),
        .pregnantFemale: Amount(2.3, unit: "g"),
        .lactatingFemale: Amount(2.3, unit: "g"),
        .elderlyMale: Amount(2.3, unit: "g"),
        .elderlyFemale: Amount(2.3, unit: "g")
    ]
    public let dietarySourcesRanked: [String] = [
        "Table salt", "Seaweed", "Rye", "Tomatoes", "Lettuce"
    ]
}

public struct Iron: Mineral {
    public let name = "Iron"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(11, unit: "mg"),
        .child: Amount(7, unit: "mg"),
        .teenageMale: Amount(11, unit: "mg"),
        .teenageFemale: Amount(15, unit: "mg"),
        .adultMale: Amount(8, unit: "mg"),
        .adultFemale: Amount(18, unit: "mg"),
        .pregnantFemale: Amount(27, unit: "mg"),
        .lactatingFemale: Amount(9, unit: "mg"),
        .elderlyMale: Amount(8, unit: "mg"),
        .elderlyFemale: Amount(8, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Beef liver", "Clams", "Red meat", "Spinach", "Lentils", "Fortified cereals", "Tofu"
    ]
}

public struct Zinc: Mineral {
    public let name = "Zinc"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(3, unit: "mg"),
        .child: Amount(5, unit: "mg"),
        .teenageMale: Amount(11, unit: "mg"),
        .teenageFemale: Amount(9, unit: "mg"),
        .adultMale: Amount(11, unit: "mg"),
        .adultFemale: Amount(8, unit: "mg"),
        .pregnantFemale: Amount(11, unit: "mg"),
        .lactatingFemale: Amount(12, unit: "mg"),
        .elderlyMale: Amount(11, unit: "mg"),
        .elderlyFemale: Amount(8, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Oysters", "Beef", "Crab", "Lamb", "Pumpkin seeds", "Chickpeas", "Cashews"
    ]
}

public struct Copper: Mineral {
    public let name = "Copper"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.22, unit: "mg"),
        .child: Amount(0.34, unit: "mg"),
        .teenageMale: Amount(0.9, unit: "mg"),
        .teenageFemale: Amount(0.9, unit: "mg"),
        .adultMale: Amount(0.9, unit: "mg"),
        .adultFemale: Amount(0.9, unit: "mg"),
        .pregnantFemale: Amount(1.0, unit: "mg"),
        .lactatingFemale: Amount(1.3, unit: "mg"),
        .elderlyMale: Amount(0.9, unit: "mg"),
        .elderlyFemale: Amount(0.9, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Liver", "Shellfish", "Nuts", "Seeds", "Dark chocolate", "Legumes"
    ]
}

public struct Manganese: Mineral {
    public let name = "Manganese"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.003, unit: "mg"),
        .child: Amount(1.2, unit: "mg"),
        .teenageMale: Amount(2.2, unit: "mg"),
        .teenageFemale: Amount(1.6, unit: "mg"),
        .adultMale: Amount(2.3, unit: "mg"),
        .adultFemale: Amount(1.8, unit: "mg"),
        .pregnantFemale: Amount(2.0, unit: "mg"),
        .lactatingFemale: Amount(2.6, unit: "mg"),
        .elderlyMale: Amount(2.3, unit: "mg"),
        .elderlyFemale: Amount(1.8, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Nuts", "Whole grains", "Legumes", "Pineapple", "Leafy vegetables", "Tea"
    ]
}

public struct Iodine: Mineral {
    public let name = "Iodine"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(110, unit: "µg"),
        .child: Amount(90, unit: "µg"),
        .teenageMale: Amount(150, unit: "µg"),
        .teenageFemale: Amount(150, unit: "µg"),
        .adultMale: Amount(150, unit: "µg"),
        .adultFemale: Amount(150, unit: "µg"),
        .pregnantFemale: Amount(220, unit: "µg"),
        .lactatingFemale: Amount(290, unit: "µg"),
        .elderlyMale: Amount(150, unit: "µg"),
        .elderlyFemale: Amount(150, unit: "µg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Seaweed", "Iodized salt", "Dairy", "Fish", "Eggs"
    ]
}

public struct Selenium: Mineral {
    public let name = "Selenium"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(15, unit: "µg"),
        .child: Amount(20, unit: "µg"),
        .teenageMale: Amount(55, unit: "µg"),
        .teenageFemale: Amount(55, unit: "µg"),
        .adultMale: Amount(55, unit: "µg"),
        .adultFemale: Amount(55, unit: "µg"),
        .pregnantFemale: Amount(60, unit: "µg"),
        .lactatingFemale: Amount(70, unit: "µg"),
        .elderlyMale: Amount(55, unit: "µg"),
        .elderlyFemale: Amount(55, unit: "µg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Brazil nuts", "Seafood", "Meat", "Eggs", "Cereal grains"
    ]
}

public struct Molybdenum: Mineral {
    public let name = "Molybdenum"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(2, unit: "µg"),
        .child: Amount(17, unit: "µg"),
        .teenageMale: Amount(45, unit: "µg"),
        .teenageFemale: Amount(43, unit: "µg"),
        .adultMale: Amount(45, unit: "µg"),
        .adultFemale: Amount(45, unit: "µg"),
        .pregnantFemale: Amount(50, unit: "µg"),
        .lactatingFemale: Amount(50, unit: "µg"),
        .elderlyMale: Amount(45, unit: "µg"),
        .elderlyFemale: Amount(45, unit: "µg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Legumes", "Grains", "Nuts", "Organ meats"
    ]
}

public struct Chromium: Mineral {
    public let name = "Chromium"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0, unit: "µg"),
        .child: Amount(11, unit: "µg"),
        .teenageMale: Amount(35, unit: "µg"),
        .teenageFemale: Amount(25, unit: "µg"),
        .adultMale: Amount(35, unit: "µg"),
        .adultFemale: Amount(25, unit: "µg"),
        .pregnantFemale: Amount(30, unit: "µg"),
        .lactatingFemale: Amount(45, unit: "µg"),
        .elderlyMale: Amount(35, unit: "µg"),
        .elderlyFemale: Amount(25, unit: "µg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Whole grains", "Meat", "Broccoli", "Grape juice", "Potatoes"
    ]
}

public struct Fluoride: Mineral {
    public let name = "Fluoride"
    public let recommendedDailyAllowances: [DemographicGroup: Amount] = [
        .infant: Amount(0.01, unit: "mg"),
        .child: Amount(0.5, unit: "mg"),
        .teenageMale: Amount(4, unit: "mg"),
        .teenageFemale: Amount(3, unit: "mg"),
        .adultMale: Amount(4, unit: "mg"),
        .adultFemale: Amount(3, unit: "mg"),
        .pregnantFemale: Amount(3, unit: "mg"),
        .lactatingFemale: Amount(3, unit: "mg"),
        .elderlyMale: Amount(4, unit: "mg"),
        .elderlyFemale: Amount(3, unit: "mg")
    ]
    public let dietarySourcesRanked: [String] = [
        "Fluoridated water", "Tea", "Fish with bones", "Toothpaste ingestion (non-food source)"
    ]
}

public enum MineralType: String, CaseIterable {
    case calcium, magnesium, phosphorus, potassium, sodium, chloride
    case iron, zinc, copper, manganese, iodine, selenium, molybdenum, chromium, fluoride

    public var mineral: Mineral {
        switch self {
        case .calcium: return Calcium()
        case .magnesium: return Magnesium()
        case .phosphorus: return Phosphorus()
        case .potassium: return Potassium()
        case .sodium: return Sodium()
        case .chloride: return Chloride()
        case .iron: return Iron()
        case .zinc: return Zinc()
        case .copper: return Copper()
        case .manganese: return Manganese()
        case .iodine: return Iodine()
        case .selenium: return Selenium()
        case .molybdenum: return Molybdenum()
        case .chromium: return Chromium()
        case .fluoride: return Fluoride()
        }
    }
}
