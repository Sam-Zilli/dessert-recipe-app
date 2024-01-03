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
                }
                .onChange(of: selectedTab) { newTab in
                    // Handle tab selection here
                    if newTab == 0 {
                        print("Explore tab clicked")
                    }
                    if newTab == 1 {
                        print("Surprise me! tab clicked")
                        Task {
                            await viewModel.getAllRecipes()
                            switch viewModel.status {
                            case .success(let data):
                                desserts = data // Update the desserts array
                            case .fetching:
                                // Handle fetching state
                                // ProgressView should be used in the view hierarchy
                                // For now, print a message
                                print("Fetching...")
                            default:
                                // Handle other states
                                // EmptyView should be used in the view hierarchy
                                // For now, print a message
                                print("Other states...")
                            }
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

