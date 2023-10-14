//
//  ContentView.swift
//  CookHub
//
//  Created by Xhulia Uni on 10.10.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isZoomed = false
    @State private var selectedRecipe: Recipe?
    
    var body: some View {
        TabView{
//            List{
//                ForEach(1..<6) { i in
//                    RecipeCardView()
//                        .listRowSeparator(.hidden)
//                    
//                }
//                .scaleEffect(isZoomed ? 1.1 : 1.0)
//                .onTapGesture {
//                    withAnimation(.linear(duration: 0.18)){
//                        isZoomed.toggle()
//                    }
//                    if isZoomed {
//                        isZoomed = false
//                    }
//                }
            }.listStyle(.plain)
                .tabItem {
                    Label("Recipes", systemImage: "list.dash")
                }
            ////
        
            
            Text("my recipes")
                .tabItem {
                    Label("My Recipes", systemImage: "plus.circle")
                }
        

    }
}

#Preview {
    ContentView()
}
