
import SwiftUI

struct EndlessRecpieView: View {
    let recipesListViewModel = RecipesListViewModel()
    @State var recipes: [Recipe] = []
    var body: some View {
        NavigationStack {
            List{
                if !recipes.isEmpty {
                        ForEach(recipes, id: \.idMeal) {
                            recipe in
                            NavigationLink(destination: RecipeFullView(recipe: recipe)){
                                RecipeCardView(recipe: recipe)
                                                                
                            }.buttonStyle(PlainButtonStyle())
                                .listRowSeparator(.hidden)
                            
                                
                        }
                }
            }.listStyle(.plain)
        }
        .onAppear(perform: {
            Task {
                recipes = await recipesListViewModel.populateRecipes()
            }
        }
        )
    }
    
}

