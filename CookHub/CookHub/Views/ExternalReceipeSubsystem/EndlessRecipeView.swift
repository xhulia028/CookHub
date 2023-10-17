import SwiftUI

struct EndlessRecpieView: View {
    @Environment(MainModel.self) private var model
    var body: some View {
        NavigationStack {
            List {
                if !model.recipes.isEmpty {
                    ForEach(model.recipes.indices, id: \.self) { index in
                        NavigationLink(destination: RecipeFullView(recipe: model.recipes[index])) {
                            RecipeCardView(recipe: model.recipes[index])
                        }.buttonStyle(PlainButtonStyle())
                        .listRowSeparator(.hidden)
                    }
                } else {
                    CustomTextView(text: "Failed fetching recipes. Try loading again")
                }

                Button(action: {
                    Task {
                        await model.fetchRecipes()
                    }
                }, label: {
                    HStack {
                        Spacer()
                        Text("Load More Recipes")
                        Spacer()
                    }
                }
                       ).listRowSeparator(.hidden)
                    .buttonStyle(.bordered)
                    .foregroundColor(Color.secondary)
            }.listStyle(.plain)
        }
    }
}
#Preview {
    LocalRecipesView().environment(MainModel())
}
