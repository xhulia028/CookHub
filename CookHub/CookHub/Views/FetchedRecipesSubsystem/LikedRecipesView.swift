import SwiftUI

struct LikedRecipesView: View {
    @Environment(MainModel.self) private var model

    var body: some View {
        NavigationStack {
            List {
                if !model.likedRecipes.isEmpty {
                    ForEach(model.likedRecipes, id: \.getIdMeal) { recipe in
                        NavigationLink(destination: RecipeFullView(recipe: recipe)) {
                            RecipeCardView(recipe: recipe)
                        }.buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                    }
                } else {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            CustomTextView(text: "No Liked Recipes Yet")
                            Spacer()
                        }
                        Spacer()
                    }
                    .foregroundColor(.secondary)
                    .listRowSeparator(.hidden)
                }
            }.listStyle(.plain)
        }
    }
}
