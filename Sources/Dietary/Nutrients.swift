//
//  Nutrients.swift
//  Dietary
//
//  Created by Umang Chouhan on 18/10/25.
//

import Foundation
import JSONSchemaBuilder

public protocol Nutrient {
    var name: String { get }
    var recommendedDailyAllowances: [DemographicGroup: Amount] { get }
    var dietarySourcesRanked: [String] { get }
}


@Schemable
public enum NutrientType: String, CaseIterable {
    // Vitamins
    case vitaminA, vitaminB1, vitaminB2, vitaminB3, vitaminB5, vitaminB6, vitaminB7, vitaminB9, vitaminB12
    case vitaminC, vitaminD, vitaminE, vitaminK

    // Minerals
    case calcium, magnesium, phosphorus, potassium, sodium, chloride
    case iron, zinc, copper, manganese, iodine, selenium, molybdenum, chromium, fluoride

    // Macronutrients
    case carbohydrates, proteins, fats, water, fiber

    public var nutrient: Nutrient {
        switch self {
        // Vitamins
        case .vitaminA: return VitaminA()
        case .vitaminB1: return VitaminB1()
        case .vitaminB2: return VitaminB2()
        case .vitaminB3: return VitaminB3()
        case .vitaminB5: return VitaminB5()
        case .vitaminB6: return VitaminB6()
        case .vitaminB7: return VitaminB7()
        case .vitaminB9: return VitaminB9()
        case .vitaminB12: return VitaminB12()
        case .vitaminC: return VitaminC()
        case .vitaminD: return VitaminD()
        case .vitaminE: return VitaminE()
        case .vitaminK: return VitaminK()

        // Minerals
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

        // Macronutrients
        case .carbohydrates: return Carbohydrates()
        case .proteins: return Proteins()
        case .fats: return Fats()
        case .water: return Water()
        case .fiber: return Fiber()
        }
    }
}
