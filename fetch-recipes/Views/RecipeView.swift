////
////  RecipeView.swift
////  fetch-recipes
////
////  Created by Sam on 1/2/24.
////
///
///
/// previous iteration - keeping for reuse later
//
//import SwiftUI
//
//struct RecipeView: View {
//    @StateObject private var viewModel = ViewModel(controller: FetchController())
//    var body: some View {
//        GeometryReader { geo in
//            ZStack {
//                TabletopBackground()
//                    .frame(width: geo.size.height, height: geo.size.height)
//                VStack {
//                    switch viewModel.status {
//                    case .success(let data):
//                            
//                            // The image with the banner below it
//                            ZStack(alignment: .bottom) {
//                                AsyncImage(url: data[0].strMealThumb) { phase in
//                                    switch phase {
//                                    case .empty:
//                                        ProgressView()
//                                    case .success(let image):
//                                        image
//                                            .resizable()
//                                            .scaledToFill()
////                                            .frame(height: geo.size.height/2)
//                                            .padding(.top)
//                                            .padding(10)
//                                    case .failure:
//                                        // Handle failure (e.g., display an error image)
//                                        Text("Failed to load image")
//                                    @unknown default:
//                                        // Handle unknown state
//                                        EmptyView()
//                                    }
//                                }
//                                Text(data[0].strMeal)
//                                    .foregroundColor(.white)
//                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
//                                    .padding(20)
//                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
////                                    .background(.ultraThinMaterial)
////                            }
////                            
////                            // The recipe text
//                            Text("Instructions: \n\n" + "\"\(data.strInstructions)\"")
//                                .multilineTextAlignment(.center)
//                                .foregroundColor(.white)
//                                .padding()
//                                .background(.ultraThinMaterial)
//                            
//                                .frame(width: geo.size.width/1.1,
//                                       height: geo.size.height)
//                                .cornerRadius(50)
////                            
////                        case .fetching:
//                            ProgressView()
//                            
//                        default:
//                            EmptyView()
//                        }
//                        Button {
//                            // temp hard coding for testing
//                            let show = "53049"
//                            Task {
//                                await viewModel.getRecipeById(for: show)
//                            }
//                        } label: {
//                            Text("New Recipe")
//                                .font(.title)
//                                .foregroundColor(.blue)
//                                .padding(10)
//                                .background(Color.white)
//                                .cornerRadius(7)
//                                .shadow(color: .yellow, radius: 3)
//                        }
//                    }
//                }
//                .frame(width: geo.size.width, height: geo.size.height)
//        }
//            .ignoresSafeArea()
//        }
//}
//
//struct RecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeView()
//    }
//}
