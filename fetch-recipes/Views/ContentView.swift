//
//  ContentView.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel(controller: FetchController())
    @State private var selectedTab: Int = 0
    @State private var desserts: [Meal] = []

    var body: some View {
        GeometryReader { geo in
            TabletopBackground()
                .frame(width: geo.size.height, height: geo.size.height)
            VStack {
                TabView(selection: $selectedTab) {
                    DessertsView(meals: desserts)
                        .tabItem {
                            Label("Explore", systemImage: "globe")
                        }
                        .tag(0)
                    Text("Random Recipe")
                        .tabItem {
                            Label("Surprise me!", systemImage: "globe")
                        }
                        .tag(1)
                }
                .onAppear {
                    UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
                    // Load desserts data immediately
                    Task {
                        await viewModel.getAllRecipes()
                        switch viewModel.status {
                        case .success(let data):
                            desserts = data
                        case .fetching:
                            print("Fetching...")
                        default:
                            print("Other states...")
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

