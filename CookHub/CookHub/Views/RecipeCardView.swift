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
                            Text("Failed to load image: \(error.localizedDescription)")
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                VStack(spacing: 0.0) {
                    
                    
                    HStack{
                        Text(recipe.strMeal)
                            .fontWeight(.bold)
                        Text("· \(recipe.strCategory)")
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading)
                    
                    
                    HStack{
                        Text("#\(recipe.strTags.replacingOccurrences(of: ",", with: " #"))")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding([.leading, .bottom])
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
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)
//        .scaleEffect(isZoomed ? 1.1 : 1.0)
//        .onTapGesture {
//            withAnimation(.linear(duration: 0.18)){
//                isZoomed.toggle()
//            }
//            if isZoomed {
//                isZoomed = false
//            }
//        }
        
    }
}

//#Preview {
//    RecipeCardView().previewLayout(.sizeThatFits)
//}
