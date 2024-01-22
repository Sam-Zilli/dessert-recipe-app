//
//  DessertDetailsView.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.

// This view shows the details of a dessert's recipe.
import SwiftUI

struct DessertDetailsView: View {
    // dataFetcher will update data to load into view
    @StateObject private var viewModel = ViewModel(dataFetcher: APIDataFetcher())
    let meal: Meal
    var body: some View {
        GeometryReader { geo in
            NavigationView {
                ScrollView {
                    switch viewModel.status {
                    case .recipeSuccess(let recipe):
                        let nonNilUniqueIngredients = recipe.uniqueIngredientsWithMeasurements
                        ZStack(alignment: .bottom) {
                            // Tabletop backrground behind the image
                            TabletopBackground()
                            // Async loading of the recipes image
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
                                    // Handling failure
                                    Text("Failed to load image")
                                @unknown default:
                                    // Handle unknown state
                                    EmptyView()
                                }
                            }
                            // Lower Banner below image with recipe name
                            Text(recipe.strMeal)
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(20)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .background(.ultraThinMaterial)
                        }
                        
                        VStack(alignment: .leading, spacing: 8) {
                            IngredientsListView(ingredients: nonNilUniqueIngredients)
                            RecipeInstructionsView(instructions: recipe.strInstructions)
                                }


                    case .fetching:
                        // Handle fetching state
                        ProgressView()
                        
                    default:
                        // Handle other states
                        EmptyView()
                    }
                }
                // loads automatically
                .onAppear {
                    Task {
                        await viewModel.getRecipeById(for: meal)
                    }
                }
            }
        }
    }
}


//struct DessertDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        DessertDetailsView(meal: 
//            Meal(idMeal: "00001",
//                 strMeal: "Recipe Name",
//                strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")!));
//    }
//}
