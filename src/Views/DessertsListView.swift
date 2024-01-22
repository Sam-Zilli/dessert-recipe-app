//
//  DessertsView.swift
//  fetch-recipes
//
//  Created by Sam on 1/3/24.
//

import SwiftUI

struct DessertsListView: View {
    let meals: [Meal]
    
    var body: some View {
        NavigationStack {
            List(meals) { meal in
                NavigationLink(destination: DessertDetailsView(meal: meal)) {
                    CardView(meal: meal)
                }
            }
            .navigationTitle("")
        }
    }
}

//struct DessertsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        DessertsListView(meals: [
//            Meal(idMeal: "52771",
//                 strMeal: "Sam's pasta recipe",
//                 strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")!),
//            Meal(idMeal: "00001",
//                 strMeal: "Another made up one!!!",
//                 strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")!),
//            Meal(idMeal: "00002",
//                 strMeal: "Another made up one!!!",
//                 strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")!),
//            Meal(idMeal: "00003",
//                 strMeal: "Another made up one!!!",
//                 strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")!),
//            Meal(idMeal: "00004",
//                 strMeal: "Another made up one!!!",
//                 strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")!),
//            Meal(idMeal: "00005",
//                 strMeal: "Another made up one!!!",
//                 strMealThumb: URL(string: "https://www.themealdb.com/images/media/meals/ustsqw1468250014.jpg")!)
//        ])
//    }
//}


