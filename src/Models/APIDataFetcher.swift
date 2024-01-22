//
//  FetchController.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//
import Foundation

protocol DataFetcher {
    func fetchDessertRecipes() async throws -> [Meal]
    func fetchRecipe(from meal: Meal) async throws -> Recipe
}


struct APIDataFetcher: DataFetcher {

    enum NetworkError: Error {
        case badURL, badResponse, decodingError
    }
    
    private let baseURL = URL(string: "https://themealdb.com/api/json/v1/1/")!
    
    // https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID
    func fetchRecipe(from meal: Meal) async throws -> Recipe {
        let mealId = meal.idMeal
        let recipeURL = baseURL.appendingPathComponent("lookup.php")
        
        var recipeComponents = URLComponents(url: recipeURL, resolvingAgainstBaseURL: true)
        // i=MEAL_ID
        let recipeQueryItem = URLQueryItem(name: "i", value: mealId.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
        recipeComponents?.queryItems = [recipeQueryItem]
        
        guard let fetchURL = recipeComponents?.url else {
            // throws error if unwrapping (recipeComponents?.url) evaluates to false
            throw NetworkError.badURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: fetchURL)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.badResponse
            }
            
            let recipeWrapper = try JSONDecoder().decode(RecipeWrapper.self, from: data)
            let recipes = recipeWrapper.meals
            
            guard let recipe = recipes.first else {
                throw NetworkError.decodingError
            }
            
            return recipe
        } catch {
            print("Error in fetchRecipe: \(error)")
            throw error
        }
    }
    
    // https://themealdb.com/api/json/v1/1/filter.php?c=Dessert
    func fetchDessertRecipes() async throws -> [Meal] {
        let recipeURL = baseURL.appendingPathComponent("filter.php")
        var recipeComponents = URLComponents(url: recipeURL, resolvingAgainstBaseURL: true)
        let recipeQueryItem = URLQueryItem(name: "c", value: "Dessert")
        recipeComponents?.queryItems = [recipeQueryItem]
        
        guard let fetchURL = recipeComponents?.url else {
            throw NetworkError.badURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: fetchURL)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw NetworkError.badResponse
            }
            
            let mealWrapper = try JSONDecoder().decode(MealWrapper.self, from: data)
            let meals = mealWrapper.meals
            // sorting in alphabetical order as per the reqs
            let sortedMeals = sortMealsAlphabetically(meals: meals)
            
            return sortedMeals
        } catch {
            print("Error in fetchDessertRecipes: \(error)")
            throw error
        }
    }
    
    func sortMealsAlphabetically(meals: [Meal]) -> [Meal] {
        let sortedMeals = meals.sorted { $0.strMeal.localizedCaseInsensitiveCompare($1.strMeal) == .orderedAscending }
        return sortedMeals
    }
    
    // ensuring there are not repeat meals in the DessertListView
    func getUniqueMealIDs() async throws -> [String] {
        let meals = try await fetchDessertRecipes()
        
        let uniqueMealIDs = Set(meals.map { $0.idMeal })
        
        // Convert the set back to an array
        let uniqueMealIDsArray = Array(uniqueMealIDs)
        print("Unique Meal IDS array", uniqueMealIDsArray)
        return uniqueMealIDsArray
    }
}
