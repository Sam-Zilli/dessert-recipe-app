//
//  RecipeInstructions.swift
//  fetch-recipes
//
//  Created by Sam on 1/21/24.
//

import SwiftUI

struct RecipeInstructionsView: View {
    let instructions: String;
    
    var body: some View {
        VStack {        
            Text("Instructions:")
                .font(.title)
                .fontWeight(.bold)
            
        }
        Text(instructions)
            .multilineTextAlignment(.leading)
            .foregroundColor(.brown)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .padding(.horizontal, 10)
    }
}

