////
////  ContentView.swift
////  fetch-recipes
////
////  Created by Sam on 1/2/24.
////
//import SwiftUI
//
//struct ContentView: View {
//    @StateObject private var viewModel = ViewModel(dataFetcher: APIDataFetcher())
//    @State private var desserts: [Meal] = []
//
//    var body: some View {
//        GeometryReader { geo in
//            NavigationView {
//                VStack {
//                    DessertsListView(meals: desserts)
//                        .onAppear {
//                            UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
//                            // Load desserts data immediately
//                            Task {
//                                await viewModel.getAllRecipes()
//                                switch viewModel.status {
//                                case .success(let data):
//                                    desserts = data
//                                case .fetching:
//                                    print("Fetching...")
//                                default:
//                                    print("Other states...")
//                                }
//                            }
//                        }
//                }
//                .navigationBarTitle("Desserts", displayMode: .inline)
//            }
//            .ignoresSafeArea()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//




import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel(dataFetcher: APIDataFetcher())
    @State private var desserts: [Meal] = []

    var body: some View {
        NavigationView {
            VStack {
                DessertsListView(meals: desserts)
                    .onAppear {
                        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()

                        // Load desserts data asynchronously
                        Task {
                            do {
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
            .navigationBarTitle("Desserts", displayMode: .inline)
        }
        .ignoresSafeArea()
    }
}
