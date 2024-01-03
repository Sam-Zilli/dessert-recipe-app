//
//  FetchController.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import Foundation


struct FetchController {
    enum NetworkError: Error {
        case badURL, badResponse
    }
    private let baseURL = URL(string: "https://themealdb.com/api/json/v1/1/")!
    
    // https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
    func fetchRecipe(from idMeal: String) async throws -> Recipe {
        let recipeURL = baseURL.appendingPathComponent("lookup.php")
        var recipeComponents = URLComponents(url: recipeURL, resolvingAgainstBaseURL: true)
        //        let recipeQueryItem = URLQueryItem(name: "i", value : idMeal)
        let recipeQueryItem = URLQueryItem(name: "i", value: idMeal.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        recipeComponents?.queryItems = [recipeQueryItem]
        
        print("Recipe URL: ", recipeURL)
        print("Recipe Components: ", recipeComponents)
        print("QueryItem: ", recipeQueryItem)
        
        guard let fetchURL = recipeComponents?.url else {
            print("ERORR IN FETCHCONTROLLER 1")
            throw NetworkError.badURL
        }
        
        print("Fetch URL: ", fetchURL)
        
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        
        print("Made it here")
        guard let response = response as? HTTPURLResponse, response.statusCode == 200
        else {
            print("ERORR IN FETCHCONTROLLER 2")
            throw NetworkError.badResponse
        }
        
        
        
        
        do {
            print(response)
            //            let decoder = JSONDecoder()
            //            let recipe = try decoder.decode(Recipe.self, from: data)
            let recipe = try JSONDecoder().decode(Recipe.self, from: data)
            print("Recipe: ", recipe)
            return recipe
        } catch {
            print("Error decoding Recipe: \(error)")
            throw error
        }
    }
}
