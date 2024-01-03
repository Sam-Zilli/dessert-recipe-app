//
//  Recipe.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import Foundation

//struct Recipe: Decodable {
//    let meals: [[String: String?]]
////    let idMeal: String
////    let strMeal: String
////    let strInstructions: String
////    let strMealThumb: URL
//    // add ingredients later!
//}

struct RecipeWrapper: Codable {
    let meals: [Meal]
}

struct Meal: Codable {
    let idMeal: String
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    // ... other properties

    // Define CodingKeys if you want to map between snake_case and camelCase
    // CodingKeys is only necessary if your variable names don't match the JSON keys
    // enum CodingKeys: String, CodingKey {
    //     case idMeal
    //     case strMeal
    //     case strCategory
    //     ...
    // }
}
