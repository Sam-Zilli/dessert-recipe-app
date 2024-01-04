//
//  DessertDetailsView.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.


import SwiftUI

struct DessertDetailsView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    let meal: Meal
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    switch viewModel.status {
                    case .recipeSuccess(let recipe):
                        let nonNilIngredients = recipe.nonNilIngredientsWithMeasurements
                        ZStack(alignment: .bottom) {
                            TabletopBackground()
                            AsyncImage(url: recipe.strMealThumb) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .padding(.top)
                                        .padding(10)
                                case .failure:
                                    // Handle failure (e.g., display an error image)
                                    Text("Failed to load image")
                                @unknown default:
                                    // Handle unknown state
                                    EmptyView()
                                }
                            }
                            Text(recipe.strMeal)
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(20)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .background(.ultraThinMaterial)
                        }
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Ingredients:")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            ForEach(nonNilIngredients, id: \.0) { ingredient, measurement in
                                Text("\(measurement) \(ingredient)")
                                    .padding(.bottom, 2)
                            }
                            
                            Text("Instructions: \n\n" + "\"\(recipe.strInstructions)\"")
                                .multilineTextAlignment(.center)
                                .foregroundColor(.brown)
                                .padding()
                                .background(.ultraThinMaterial)
                                .frame(width: geo.size.width/1.1, height: geo.size.height)
                                .cornerRadius(50)
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
}



