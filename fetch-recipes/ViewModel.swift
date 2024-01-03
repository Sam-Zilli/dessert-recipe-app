//
//  ViewModel.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import Foundation

@MainActor
class ViewModel: ObservableObject {
    enum Status {
        case notStarted
        case fetching
        case success(data: [Meal])
        case recipeSuccess(data: Recipe)
        case failed(error: Error)
    }
    
    // initalizing
    @Published private(set) var status: Status = .notStarted
    
    private let controller : FetchController
    
    
    init(controller: FetchController) {
        self.controller = controller
    }
    
    func getAllRecipes() async {
        status = .fetching
        
        do {
            let meals = try await controller.fetchDessertRecipes()
            status = .success(data: meals)
            
        }
        catch {
            status = .failed(error: error)
        }
    }
    
    
    func getRecipeById(for meal: Meal) async {
            status = .fetching
    
            do {
                let recipe = try await controller.fetchRecipe(from: meal)
                status = .recipeSuccess(data: recipe)
            }
            catch {
                status = .failed(error: error)
            }
        }


 }
