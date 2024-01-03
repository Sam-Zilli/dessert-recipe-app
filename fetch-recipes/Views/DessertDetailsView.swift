//
//  DessertDetailsView.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.
//
import SwiftUI

struct DessertDetailsView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    let meal: Meal

    var body: some View {
        NavigationView {
            ScrollView {
                switch viewModel.status {
                case .recipeSuccess(let recipe):
                    VStack(alignment: .leading) {
                        Text(recipe.strInstructions)
                            .padding()
                    }

                case .fetching:
                    // Handle fetching state
                    ProgressView()

                default:
                    // Handle other states
                    EmptyView()
                }
            }
            .onAppear {
                Task {
                    await viewModel.getRecipeById(for: meal)
                }
            }
            .navigationTitle(meal.strMeal)
        }
    }
}



