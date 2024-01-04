//
//  Meal.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.
//

import Foundation

struct MealWrapper: Codable {
    let meals: [Meal]
}

struct Meal: Codable, Identifiable {
    var id: String { idMeal }
    let idMeal: String
    let strMeal: String
    let strMealThumb: URL

    enum CodingKeys: String, CodingKey {
        case idMeal
        case strMeal
        case strMealThumb
    }

    init(idMeal: String, strMeal: String, strMealThumb: URL) {
        self.idMeal = idMeal
        self.strMeal = strMeal
        self.strMealThumb = strMealThumb

    }
}

func sortMealsAlphabetically(meals: [Meal]) -> [Meal] {
    let sortedMeals = meals.sorted { $0.strMeal.localizedCaseInsensitiveCompare($1.strMeal) == .orderedAscending }
    return sortedMeals
}

//extension Meal {
//    static let sampleData: [Meal] =
//    [
//        Meal(idMeal : "53049",
//                strMeal : "Food 1",
//                strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!),
//        
//        Meal(idMeal: "52768",
//                strMeal : "Food 2",
//                strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!),
//        
//        Meal(idMeal: "12345",
//                strMeal : "Food 3",
//                strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg")!)
//
//    ]
//}
