//
//  ListRecipesView.swift
//  fetch-recipes
//
//  Created by Sam on 1/2/24.
//

import SwiftUI

struct ListRecipesView: View {
    var body: some View {
        GeometryReader{ geo in
        ZStack{
            TabletopBackground()
                    .frame(width: geo.size.height, height: geo.size.height)
                ScrollView {
                VStack {
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alsdsdfskl")
                    Text("aldghfjyukuhilklskl")
                    Text("alskdalksdjsdflskl")
                    Text("alsdfsdfsflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("afdghdfghdfghlskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdffghdfghdfghskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdfghdfghlskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdfghdfghflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("afdghdfghdfghlskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdffghdfghdfghskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdfghdfghlskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdfghdfghflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                    Text("alskdalksdjsdflskl")
                }
                .font(.title)
                    
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ListRecipesView()
}
