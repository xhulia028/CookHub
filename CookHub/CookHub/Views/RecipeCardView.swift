//
//  RecipeCardView.swift
//  CookHub
//
//  Created by Xhulia Uni on 10.10.23.
//

import SwiftUI

struct RecipeCardView: View {
    var recipe: Recipe
//    @ObservedObject private var recipeViewModel = RecipeViewModel()
    @State private var isFilled = false
    @State var isZoomed = false
    
    var body: some View {
        VStack{
                ZStack{
                    AsyncImage(url: URL(string: recipe.strMealThumb)){ phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(height: 150)
                                .clipped()
                        case .failure(let error):
                            CustomTextView( text:"Failed to load image: \(error.localizedDescription)")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                VStack(spacing: 0.0) {
                    
                    
                    HStack{
                        CustomTextView( text:recipe.strMeal)
                            .fontWeight(.bold)
                        CustomTextView( text:"· \(recipe.strCategory)")
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading)
                    
                    
                    HStack{
                        CustomTextView( text:"#\(recipe.strTags.replacingOccurrences(of: ",", with: " #"))")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding([.leading, .bottom])
                        if !recipe.isLocal{
                            Button(action: {
                                withAnimation {
                                    isFilled.toggle()
                                }
                                
                            })
                            {
                                Image(systemName: isFilled ? "heart.fill" : "heart")
                                    .foregroundColor(isFilled ? .red : .gray)
                                    .imageScale(.large)
                                    .scaleEffect(isFilled ? 1.2 : 1.0)
                                    .foregroundColor(.red)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                        }
                    }
                }
                
            
            
        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)

        
    }
}

