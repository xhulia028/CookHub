import SwiftUI

struct RecipeCardView: View {
    @Bindable var recipe: Recipe
    @State var isZoomed = false

    var body: some View {
        VStack {
            ZStack {
                AsyncImageView(string: recipe.getStrMealThumb)
            }
            VStack(spacing: 0.0) {

                HStack {
                    CustomTextView( text: recipe.getStrMeal)
                        .fontWeight(.bold)
                    CustomTextView( text: "· \(recipe.getStrCategory)")
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                .padding(.leading)

                HStack {
                    CustomTextView( text: "#\(recipe.getStrTags.replacingOccurrences(of: ",", with: " #"))")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding([.leading, .bottom])
                    if !recipe.isLocal {
                        Button(action: {
                            withAnimation {
                                recipe.isLiked.toggle()
                            }
                        }, label: {
                            Image(systemName: recipe.isLiked ? "heart.fill" : "heart")
                                .foregroundColor(recipe.isLiked ? .red : .gray)
                                .imageScale(.large)
                                .scaleEffect(recipe.isLiked ? 1.2 : 1.0)
                                .foregroundColor(.red)

                        }
                               ).frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                    }
                }
            }

        }
        .background(Color(.tertiarySystemFill))
        .cornerRadius(12)

    }
}
