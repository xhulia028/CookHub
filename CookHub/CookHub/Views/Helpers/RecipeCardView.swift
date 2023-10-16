import SwiftUI

struct RecipeCardView: View {
    @State var recipe: Recipe
    @State var isZoomed = false
    
    var body: some View {
        VStack{
                ZStack{
                    AsyncImage(url: URL(string: recipe.getStrMealThumb)){ phase in
                        switch phase {
                        case .empty:
                            Image("no_image")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(height: 150)
                                .clipped()
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(height: 150)
                                .clipped()
                        case .failure(_):
                            Image("no_image")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(height: 150)
                                .clipped()
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                VStack(spacing: 0.0) {
                    
                    
                    HStack{
                        CustomTextView( text:recipe.getStrMeal)
                            .fontWeight(.bold)
                        CustomTextView( text:"· \(recipe.getStrCategory)")
                            .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .padding(.leading)
                    
                    
                    HStack{
                        CustomTextView( text:"#\(recipe.getStrTags.replacingOccurrences(of: ",", with: " #"))")
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding([.leading, .bottom])
                        if !recipe.isLocal{
                            Button(action: {
                                withAnimation {
                                    recipe.isLiked.toggle()
                                }
                                
                            })
                            {
                                Image(systemName: recipe.isLiked ? "heart.fill" : "heart")
                                    .foregroundColor(recipe.isLiked ? .red : .gray)
                                    .imageScale(.large)
                                    .scaleEffect(recipe.isLiked ? 1.2 : 1.0)
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

