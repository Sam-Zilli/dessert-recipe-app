//
//  Meal.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.
//

import Foundation

// MealWrapper accesses inner layer of data from API call
struct MealWrapper: Codable {
    let meals: [Meal]
}

// struct for each individual meal
// Codable: So it can be encoded and decoded from JSON
// Identifiable: For use with SwiftUI, has unique ID
struct Meal: Codable, Identifiable {
    var id: String { idMeal }
    let idMeal: String
    let strMeal: String
    let strMealThumb: URL

    // used for decoding since API JSON is not always formatted well
    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strMealThumb
    }

    // constructors instances of Meal
    init(idMeal: String, strMeal: String, strMealThumb: URL) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb

    }
}

// Helper function for sorting the meals list to be alphabetical
func sortMealsAlphabetically(meals: [Meal]) -> [Meal] {
    let sortedMeals = meals.sorted { $0.strMeal.localizedCaseInsensitiveCompare($1.strMeal) == .orderedAscending }
    return sortedMeals
}

