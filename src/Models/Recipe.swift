// Recipe.swift

import Foundation

// RecipeWrapper accesses inner layer of data from API call
public struct RecipeWrapper: Codable {
    let meals: [Recipe]
}

// A recipe is the details of a meal
// API has unpredictable # Ingredients, measurements, etc. so hardcoded max possible for each
public struct Recipe: Codable, Identifiable {
    public let idMeal: String
    public let strMeal: String
    public let strCategory: String?
    public let strInstructions: String
    public let strMealThumb: URL?
    public let strIngredient1: String
    public let strIngredient2: String?
    public let strIngredient3: String?
    public let strIngredient4: String?
    public let strIngredient5: String?
    public let strIngredient6: String?
    public let strIngredient7: String?
    public let strIngredient8: String?
    public let strIngredient9: String?
    public let strIngredient10: String?
    public let strIngredient11: String?
    public let strIngredient12: String?
    public let strIngredient13: String?
    public let strIngredient14: String?
    public let strIngredient15: String?
    public let strIngredient16: String?
    public let strIngredient17: String?
    public let strIngredient18: String?
    public let strIngredient19: String?
    public let strIngredient20: String?

    public let strMeasure1: String
    public let strMeasure2: String?
    public let strMeasure3: String?
    public let strMeasure4: String?
    public let strMeasure5: String?
    public let strMeasure6: String?
    public let strMeasure7: String?
    public let strMeasure8: String?
    public let strMeasure9: String?
    public let strMeasure10: String?
    public let strMeasure11: String?
    public let strMeasure12: String?
    public let strMeasure13: String?
    public let strMeasure14: String?
    public let strMeasure15: String?
    public let strMeasure16: String?
    public let strMeasure17: String?
    public let strMeasure18: String?
    public let strMeasure19: String?
    public let strMeasure20: String?

    public var id: String { idMeal }

}

extension Recipe {
    // Gets unique ingredients and their corresponding measurements
    public var uniqueIngredientsWithMeasurements: [(ingredient: String, measurement: String)] {
        let ingredients: [(String?, String?)] = [
            (strIngredient1, strMeasure1),
            (strIngredient2, strMeasure2),
            (strIngredient3, strMeasure3),
            (strIngredient4, strMeasure4),
            (strIngredient5, strMeasure5),
            (strIngredient6, strMeasure6),
            (strIngredient7, strMeasure7),
            (strIngredient8, strMeasure8),
            (strIngredient9, strMeasure9),
            (strIngredient10, strMeasure10),
            (strIngredient11, strMeasure11),
            (strIngredient12, strMeasure12),
            (strIngredient13, strMeasure13),
            (strIngredient14, strMeasure14),
            (strIngredient15, strMeasure15),
            (strIngredient16, strMeasure16),
            (strIngredient17, strMeasure17),
            (strIngredient18, strMeasure18),
            (strIngredient19, strMeasure19),
            (strIngredient20, strMeasure20)
        ]

        // Create a set to store unique ingredients
        var uniqueIngredientsSet = Set<String>()

        // Filter out repeated and nil ingredients
        let uniqueIngredientsWithMeasurements: [(ingredient: String, measurement: String)] = ingredients
            .compactMap { (ingredient, measurement) -> (ingredient: String, measurement: String)? in
                guard let ingredient = ingredient, !ingredient.isEmpty else {
                    return nil
                }

                // Check if the ingredient is unique
                guard uniqueIngredientsSet.insert(ingredient).inserted else {
                    return nil
                }

                return (ingredient, measurement ?? "")
            }

        return uniqueIngredientsWithMeasurements
    }
}

