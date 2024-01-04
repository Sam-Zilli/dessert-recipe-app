//
//  CardView.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.
//
import SwiftUI

struct CardView: View {
    let meal: Meal
    var body: some View {
        ZStack{
            TabletopBackground()
            VStack(alignment: .leading) {
                Text(meal.strMeal)
                    .font(.headline)
                    .accessibilityAddTraits(.isHeader)
                Spacer()
                    .font(.caption)
                
                AsyncImage(url: meal.strMealThumb) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                    case .failure:
                        Image(systemName: "photo")
                            .scaledToFit()
                    @unknown default:
                        EmptyView()
                    }
                }
            }            .padding()
        }
    }
}
