//
//  DessertsView.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.
//

import SwiftUI

struct DessertsView: View {
    let meals: [Meal]
    
    var body: some View {
        NavigationStack {
            List(meals) { meal in
                NavigationLink(destination: DessertDetailsView(meal: meal)) {
                    CardView(meal: meal)
                }
            }
            .navigationTitle("Desserts")
        }
    }
}

