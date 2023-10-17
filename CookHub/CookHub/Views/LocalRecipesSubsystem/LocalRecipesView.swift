import SwiftUI
import AlertToast

struct LocalRecipesView: View {
    @State private var showAddRecipe = false
    @Environment(MainModel.self) private var model
    @State private var showToast = false

    var body: some View {
        NavigationView {

            ZStack(alignment: .bottomTrailing) {
                VStack {
                    if model.isLocalrecipesEmpty() {

                        CustomTextView( text: "You have no recipes")

                    } else {

                        ForEach(model.localRecipes, id: \.getStrMeal) { recipe in
                            NavigationLink(destination: RecipeFullView(recipe: recipe)) {
                                RecipeCardView(recipe: recipe)

                            }.buttonStyle(PlainButtonStyle())
                            .listRowSeparator(.hidden)
                        }
                    }
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .toast(isPresenting: $showToast, duration: 1.5, tapToDismiss: true) {

                    AlertToast(type: .complete(Color.green), title: "New Recipe Created")

                }

                Button {
                    showAddRecipe = true

                } label: {
                    Image(systemName: "plus")
                        .font(.title.weight(.semibold))
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .shadow(radius: 4, x: 0, y: 4)

                }
                .padding()

            }
            .navigationViewStyle(.stack)
            .sheet(isPresented: $showAddRecipe, content: {
                CreateRecipeView(onDismiss: {
                    showToast = true
                })
                .environment(model)

            })

        }
        .padding()

    }
}

#Preview {
    LocalRecipesView().environment(MainModel())
}
