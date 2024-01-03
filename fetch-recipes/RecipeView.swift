//
//  RecipeView.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import SwiftUI

struct RecipeView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("tabletop").resizable()
                VStack {
                    switch viewModel.status {
                    case .success(let data):
                        // The image with the banner below it
                        ZStack(alignment: .bottom) {
                            Image("MEALEX")
                                .resizable()
                                .scaledToFill()
                            Text(data.strMeal)
                                .foregroundColor(.white)
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding(20)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                                .background(.ultraThinMaterial)
                        }
                        // The recipe text
//                        Text("\"\(data.strInstructions)\"")
//                            .multilineTextAlignment(.center)
//                            .foregroundColor(.white)
//                            .padding()
                        
                        .frame(width: geo.size.width/1.2,
                               height: geo.size.height/3)
                        .cornerRadius(50)
                        
                    case .fetching:
                        ProgressView()
                        
                    default:
                        EmptyView()
                    }
                    Button {
                        // temp hard coding for testing
                        let show = "53049"
                        Task {
                            await viewModel.getData(for: show)
                        }
                    } label: {
                        Text("New Recipe")
                            .font(.title)
                            .foregroundColor(.blue)
                            .padding(10)
                            .background(Color.white)
                            .cornerRadius(7)
                            .shadow(color: .yellow, radius: 3)
                    }
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}
//
//#Preview {
//    RecipeView()
//}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
