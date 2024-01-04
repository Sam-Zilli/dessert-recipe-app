//
//  Recipe.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import Foundation
struct RecipeWrapper: Codable {
    let meals: [Recipe]
}

struct Recipe: Codable, Identifiable {
    let idMeal: String
    let strMeal: String
    let strCategory: String?
    let strInstructions: String
    let strMealThumb: URL?
    let strIngredient1: String
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    var id: String { idMeal }

}


extension Recipe {
    // gets all null, empty strings and repeat ingredients out and returns list of GOOD ingredients
    var nonNilIngredients: [String] {
        let ingredients = [
            strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5,
            strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10,
            strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15,
            strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        ]

        let uniqueIngredients = Array(Set(ingredients.compactMap { $0 }))
        let filteredIngredients = uniqueIngredients.filter { !$0.isEmpty }
        
        return filteredIngredients
    }
}



extension Recipe {
    static let sampleData: [Recipe] =
    [
        Recipe(idMeal: "53049",
             strMeal: "Apple & Blackberry Crumble",
             strCategory: "Dessert",
             strInstructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.",
             strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!,
             strIngredient1: "Milk",
             strIngredient2: "Oil",
             strIngredient3: "Eggs",
             strIngredient4: "Flour",
             strIngredient5: "Baking Powder",
             strIngredient6: "Salt",
             strIngredient7: "Unsalted Butter",
             strIngredient8: "Sugar",
             strIngredient9: "Peanut Butter",
             strIngredient10: "",
             strIngredient11: "",
             strIngredient12: "",
             strIngredient13: "",
             strIngredient14: "",
             strIngredient15: "",
             strIngredient16: "",
             strIngredient17: "",
             strIngredient18: "",
             strIngredient19: "",
             strIngredient20: ""
        ),
        Recipe(idMeal: "52893",
             strMeal: "Apple & Blackberry Crumble",
             strCategory: "Dessert",
             strInstructions: "Instructions for Apple & Blackberry Crumble",
             strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!,
             strIngredient1: "Ingredient1",
             strIngredient2: "Ingredient2",
             strIngredient3: "Ingredient3",
             strIngredient4: "Ingredient4",
             strIngredient5: "Ingredient5",
             strIngredient6: "Ingredient6",
             strIngredient7: "Ingredient7",
             strIngredient8: "Ingredient8",
             strIngredient9: "Ingredient9",
             strIngredient10: "Ingredient10",
             strIngredient11: "Ingredient11",
             strIngredient12: "Ingredient12",
             strIngredient13: "Ingredient13",
             strIngredient14: "Ingredient14",
             strIngredient15: "Ingredient15",
             strIngredient16: "Ingredient16",
             strIngredient17: "Ingredient17",
             strIngredient18: "Ingredient18",
             strIngredient19: "Ingredient19",
             strIngredient20: "Ingredient20"
        ),
    ]
}
