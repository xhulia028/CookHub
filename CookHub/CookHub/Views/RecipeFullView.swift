//
//  MealInstructionsView.swift
//  CookHub
//
//  Created by Xhulia Uni on 14.10.23.
//

import SwiftUI

struct RecipeFullView: View {
    var recipe: Recipe
    @State private var isFilled = false
    var body: some View {
        ScrollView {
            VStack {
                
                    VStack(alignment: .leading) {
                        AsyncImage(url: URL(string: recipe.strMealThumb)){ phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(maxHeight: 200)
                                
                                    .shadow(color: Color.black.opacity(0.3), radius: 4, x:0, y: 4)
                                    .cornerRadius(25)
                                
                            case .failure(let error):
                                Text("Failed to load image: \(error.localizedDescription)")
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }.padding()
                    
                    HStack {
                        Text(recipe.strMeal)
                            .padding()
                            .font(.title).bold()
                            
                        Spacer()
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
                        .padding()
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    HStack{
                        
                        Text("Category: \(recipe.strCategory)")
                            .font(.headline)
                            .padding()
                        
                        Text("Area: \(recipe.strArea)")
                            .font(.headline)
                            .padding()
                        
                        
                    }
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading){
                            Text("Ingredients:")
                                .font(.title3).bold()
                                .padding(.vertical, 5)
                            
                            let ingredients = recipe.getIngredients()
                            let measurements = recipe.getMeasurements()
                            
                            ForEach(0..<20) { index in
                                if !ingredients[index].isEmpty {
                                    Text("\(ingredients[index]) -  \(measurements[index])")
                                        .font(.body)
                                    
                                }
                            }
                            
                            
                        } .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                    }.background(.ultraThinMaterial)
                        .cornerRadius(15)
                        .padding()
                    
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading){
                            Text("Instructions:")
                                .font(.title3).bold()
                                .padding(.vertical, 5)
                            
                            Text(recipe.strInstructions)
                                .font(.body)
                            
                        } .frame(maxHeight: .infinity, alignment: .top)
                            .padding()
                    }.background(.ultraThinMaterial)
                        .cornerRadius(15)
                        .padding()
                    
            }
        }
    }
}

//#Preview {
//    RecipeFullView()
//}
