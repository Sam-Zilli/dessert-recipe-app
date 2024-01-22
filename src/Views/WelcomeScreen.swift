//
//  WelcomeScreen.swift
//  fetch-recipes
//
//  Created by Sam on 1/21/24.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        ZStack {
            TabletopBackground();
            Text("alksdjlakjdlkasjd")
            Image("welcome_logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
        }
    }
}

#Preview {
    WelcomeScreen()
}
