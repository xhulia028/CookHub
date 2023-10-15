
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
                                CustomTextView( text:"Failed to load image: \(error.localizedDescription)")
                            @unknown default:
                                EmptyView()
                            }
                        }
                    }.padding()
                    
                    HStack {
                        CustomTextView( text:recipe.strMeal)
                            .padding()
                            .font(.title).bold()
                            
                        Spacer()
                       
                        if !recipe.isLocal {
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
                        
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    HStack{
                        
                        CustomTextView( text:"Category: \(recipe.strCategory)")
                            .font(.headline)
                            .padding()
                        
                        CustomTextView( text:"Area: \(recipe.strArea)")
                            .font(.headline)
                            .padding()
                        
                        
                    }
                    
                    VStack(alignment: .leading) {
                        VStack(alignment: .leading){
                            CustomTextView( text:"Ingredients:")
                                .font(.title3).bold()
                                .padding(.vertical, 5)
                            
                            
                            
                            ForEach(0..<recipe.ingredients.count, id: \.self) { index in
                                if !recipe.ingredients[index].isEmpty {
                                    CustomTextView( text:"\(recipe.ingredients[index]) -  \(recipe.measurements[index])")
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
                            CustomTextView( text:"Instructions:")
                                .font(.title3).bold()
                                .padding(.vertical, 5)
                            
                            CustomTextView( text:recipe.strInstructions)
                                .font(.body)
                            
                        } .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                            .padding()
                    }.background(.ultraThinMaterial)
                        .cornerRadius(15)
                        .padding()
                    
            }
        }
    }
}

