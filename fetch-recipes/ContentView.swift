//
//  ContentView.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, worldergerge!")
//            Label("New label", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)
//
//        }
        TabView {
            // A list of all the recipes, in alphabetical order
            ListRecipesView()
                .tabItem {
                    Label("Explore", systemImage: "globe")
                }
            // Chooses a random recipe
            Text("Random Recipe")
                // RecipeView is used for both Random Recipe feature and if a user chooses a recipe from the ListRecipesView
                RecipeView()
                .tabItem {
                    Label("Suprise me!", systemImage: "globe")
                }
        }
        .onAppear {
            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
        }
    }
}

#Preview {
    ContentView()
}
