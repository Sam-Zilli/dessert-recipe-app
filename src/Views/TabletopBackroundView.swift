// TabletopBackgroundView.swift
// fetch-recipes
//
// Created by Sam on 1/21/24.

import SwiftUI

// resused loading of brown wood table as background image
struct TabletopBackground: View {
    var body: some View {
        Image("tabletop")
            .resizable()
            .ignoresSafeArea()
            .background(Color.brown)
    }
}

let constantTabletopBackground = TabletopBackground()
