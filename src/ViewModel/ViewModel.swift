//
//  ViewModel.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//
import Foundation

@MainActor
class ViewModel: ObservableObject {
    // databinding
    enum Status {
        case notStarted
        case fetching
        case success(data: [Meal])
        case recipeSuccess(data: Recipe)
        case failed(error: Error)
    }
    
    // annouces changes to status so views can react to changes in viewModel
    @Published private(set) var status: Status = .notStarted
    
    
    // APIDataFetcher creation
    private let dataFetcher: DataFetcher
    init(dataFetcher: DataFetcher) {
        self.dataFetcher = dataFetcher
    }
    
    // gets all the recipes to load them into views, status = .success communciates update
    func getAllRecipes() async {
        status = .fetching
        
        do {
            let meals = try await dataFetcher.fetchDessertRecipes()
            status = .success(data: meals)
            
        }
        catch {
            status = .failed(error: error)
        }
    }
    
    // uses an id to get Recipe of a Meal
    func getRecipeById(for meal: Meal) async {
            status = .fetching
            do {
                // needed its own success since it gets a recipe instead of a meal
                let recipe = try await dataFetcher.fetchRecipe(from: meal)
                status = .recipeSuccess(data: recipe)
            }
            catch {
                status = .failed(error: error)
            }
        }
 }
