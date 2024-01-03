//
//  FetchController.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import Foundation


struct FetchController {
    enum NetworkError: Error {
        case badURL, badResponse, decodingError
    }
    
    private let baseURL = URL(string: "https://themealdb.com/api/json/v1/1/")!
    
    // https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
    func fetchRecipe(from idMeal: String) async throws -> Meal {
        let recipeURL = baseURL.appendingPathComponent("lookup.php")
        var recipeComponents = URLComponents(url: recipeURL, resolvingAgainstBaseURL: true)
        let recipeQueryItem = URLQueryItem(name: "i", value: idMeal.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        recipeComponents?.queryItems = [recipeQueryItem]
        
        guard let fetchURL = recipeComponents?.url else {
            throw NetworkError.badURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: fetchURL)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.badResponse
            }
            
            let recipeWrapper = try JSONDecoder().decode(RecipeWrapper.self, from: data)
            let meals = recipeWrapper.meals
            
            guard let firstMeal = meals.first else {
                throw NetworkError.decodingError
            }
            print(firstMeal.idMeal)
            print(firstMeal.strCategory)
            print(firstMeal.strInstructions)
            return firstMeal
        } catch {
            print("Error in fetchRecipe: \(error)")
            throw error
        }
    }
}

