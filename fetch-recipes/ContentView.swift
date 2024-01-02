//
//  ContentView.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, worldergerge!")
            Label("New label", systemImage: /*@START_MENU_TOKEN@*/"42.circle"/*@END_MENU_TOKEN@*/)

        }
        .padding()
    }
}

#Preview {
    ContentView()
}
