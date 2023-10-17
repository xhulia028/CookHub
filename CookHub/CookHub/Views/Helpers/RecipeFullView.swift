import SwiftUI

struct RecipeFullView: View {
    @Bindable var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack {
                    AsyncImageFullView(url: recipe.getStrMealThumb)
                HStack {
                    CustomTextView( text: recipe.getStrMeal)
                        .padding()
                        .font(.title)

                    Spacer()

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
                        ).padding()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()

                HStack {
                    CustomTextView( text: "Category: \(recipe.getStrCategory)")
                        .font(.headline)
                        .padding()

                    CustomTextView( text: "Area: \(recipe.getStrArea)")
                        .font(.headline)
                        .padding()
                }
                IngredientsView(ingredients: recipe.ingredients, measurements: recipe.measurements)

                InstructionsView(getStrInstructions: recipe.getStrInstructions)
            }
        }
    }
}
