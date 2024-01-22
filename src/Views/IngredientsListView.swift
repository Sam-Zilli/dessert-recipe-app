//
//  IngredientsListView.swift
//  fetch-recipes
//
//  Created by Sam on 1/21/24.
//

import SwiftUI
struct IngredientsListView: View {
    let ingredients: [(String, String)]

    var body: some View {
        
        VStack(alignment: .leading, spacing: 8) {
            
            Text("Ingredients: \(ingredients.count)")
                .font(.title)
                .fontWeight(.bold)

            ForEach(ingredients, id: \.0) { 
                ingredient, measurement in
                Text("\(measurement) \(ingredient)")
                    .padding(.bottom, 2)
                    .foregroundColor(.brown)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            .padding(.horizontal, 10)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

