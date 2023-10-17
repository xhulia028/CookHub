import SwiftUI

struct RecipeFullView: View {
    @Bindable var recipe: Recipe
    var body: some View {
        ScrollView {
            VStack {

                VStack(alignment: .leading) {
                    AsyncImageFullView(url: recipe.getStrMealThumb)
                }.padding()

                HStack {
                    CustomTextView( text: recipe.getStrMeal)
                        .padding()
                        .font(.title).bold()

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

                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        CustomTextView( text: "Ingredients:")
                            .font(.title3).bold()
                            .padding(.vertical, 5)

                        ForEach(0..<recipe.ingredients.count, id: \.self) { index in
                            if !recipe.ingredients[index].isEmpty {
                                CustomTextView( text: "\(recipe.ingredients[index]) -  \(recipe.measurements[index])")
                                    .font(.body)
                            }
                        }
                    } .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }.background(.ultraThinMaterial)
                .cornerRadius(15)
                .padding()

                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        CustomTextView( text: "Instructions:")
                            .font(.title3).bold()
                            .padding(.vertical, 5)

                        CustomTextView( text: recipe.getStrInstructions)
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
