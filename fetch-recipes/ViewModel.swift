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
        case success(data: Recipe)
        case failed(error: Error)
    }
    
    // initalizing
    @Published private(set) var status: Status = .notStarted
    
    private let controller : FetchController
    
    
    init(controller: FetchController) {
        self.controller = controller
    }
    
    func getData(for idMeal: String) async {
        status = .fetching
        
        do {
            let recipe = try await controller.fetchRecipe(from: idMeal)
            status = .success(data: recipe)
        }
        catch {
            status = .failed(error: error)
        }
    }
 }

