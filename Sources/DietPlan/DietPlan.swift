//
//  DietPlan.swift
//  Dietary
//
//  Created by Umang Chouhan on 13/11/25.
//

import Foundation

public enum FoodAttribute: String, Codable, CaseIterable, Hashable {
    
    // --- DIETARY RESTRICTIONS (Objective facts) ---
    case vegan, vegetarian, glutenFree, dairyFree, keto, paleo, lowFODMAP
    
    // --- NUTRITIONAL PROFILE (Objective facts) ---
    case highProtein, lowCarb, lowFat, highFiber
    
    // --- FOOD CATEGORY (Objective facts) ---
    case fruit, vegetable, meat, poultry, fish, seafood, grain, legume, dairy, nut, seed
    case snack, staple
}

/// Defines a user's dietary goal, which is used to filter
/// and prioritize food suggestions.
public struct DietPlan {
    public let id: String
    public let name: String
    public let description: String
    
    // --- FILTERS ---
    
    /// A hard limit for calories per 100g.
    /// `nil` means no limit.
    public var maxCaloriesPer100g: Double? = nil
    
    /// A hard requirement for tags.
    /// e.g., for a "Vegan" plan, this would be `[.vegan]`
    public var requiredTags: [FoodAttribute] = []
    
    // --- PRIORITIZATION ---
    
    /// A list of nutrients this plan cares most about.
    /// e.g., "Strong Joints" would prioritize `[.calcium, .vitaminD]`
    public var prioritizedNutrients: [NutrientType] = []
    
    /// A list of tags to "boost" in search results.
    /// e.g., "Bright Skin" would prefer foods tagged with `[.skinHealth]`
    public var preferredTags: [FoodAttribute] = []

    
    // --- Example Static Plans ---
    
    public static let standard = DietPlan(
        id: "standard",
        name: "Standard",
        description: "A balanced approach to suggestions."
    )
    
    public static let lowCalorie = DietPlan(
        id: "low_calorie",
        name: "Low Calorie",
        description: "Suggests foods to fill gaps without adding many calories.",
        maxCaloriesPer100g: 150 // e.g., max 150 kcal per 100g
    )
    
    public static let brightSkin = DietPlan(
        id: "bright_skin",
        name: "Bright Skin",
        description: "Suggests foods rich in nutrients for skin health.",
        prioritizedNutrients: [.vitaminC, .vitaminE, .zinc, .water],
        preferredTags: [.skinHealth]
    )

    public static let strongJoints = DietPlan(
        id: "strong_joints",
        name: "Strong Joints",
        description: "Suggests foods for bone and joint health.",
        prioritizedNutrients: [.calcium, .vitaminD, .vitaminC, .proteins], // Note: We don't have Omega-3 in your enum, but it would go here.
        preferredTags: [.jointHealth]
    )
    
    public static let vegan = DietPlan(
        id: "vegan",
        name: "Vegan",
        description: "Suggests only plant-based food items.",
        requiredTags: [.vegan]
    )
}

/// The final suggestion object that will be passed to the UI.
public struct FoodSuggestion {
    public let food: Food
    public let reason: String
    public let fulfillingDeficiency: NutrientType
}
