import Foundation

@GenerateJSONSchema
public struct FoodItem {
    
    /// The common name of the food (e.g., "Apple", "Chicken Breast").
    public let name: String
    
    /// The serving size for which the nutrient amounts are specified.
    public let servingSize: Amount
    
    /// A dictionary mapping each nutrient type to its
    /// specific amount in this food's serving.
    public let nutrients: [NutrientType: Amount]
    
    /// Provides easy access to the amount of a specific nutrient.
    /// Returns nil if the nutrient is not listed for this food.
    public func amount(of nutrient: NutrientType) -> Amount? {
        return nutrients[nutrient]
    }
}
