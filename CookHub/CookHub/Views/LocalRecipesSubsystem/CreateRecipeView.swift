import SwiftUI
import AlertToast

struct CreateRecipeView: View {
    @Environment(MainModel.self) private var model
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.dismiss) var dismiss

    @State var localRecipesViewModel = LocalRecipesViewModel()

    var onDismiss: () -> Void

    var body: some View {

        NavigationView {
            Form {
                Section(header: CustomTextView( text: "Recipe Details")) {
                    TextField("Meal Name", text: $localRecipesViewModel.strMeal)
                    TextField("Category", text: $localRecipesViewModel.strCategory)
                    TextField("Area", text: $localRecipesViewModel.strArea)
                }

                Section(header: CustomTextView( text: "Instructions")) {
                    TextEditor(text: $localRecipesViewModel.strInstructions)
                        .frame(minHeight: 200)
                }

                Section(header: CustomTextView( text: "Ingredients")) {
                    ForEach($localRecipesViewModel.ingredients.indices, id: \.self) { index in

                        IngredientView(ingredient: $localRecipesViewModel.ingredients[index],
                                       amount: $localRecipesViewModel.measurements[index]) {
                            localRecipesViewModel.ingredients.remove(at: index)
                            localRecipesViewModel.measurements.remove(at: index)
                        }

                    }
                    if localRecipesViewModel.ingredients.count < 20 {

                        Button(action: {
                            localRecipesViewModel.ingredients.append("")
                            localRecipesViewModel.measurements.append("")
                        }) {
                            CustomTextView( text: "Add Ingredient")
                        }
                    }
                }

                Section(header: CustomTextView( text: "Thumbnail URL")) {
                    TextField("Thumbnail URL", text: $localRecipesViewModel.strMealThumb)
                }

                Section(header: CustomTextView( text: "Additional Information")) {
                    TextField("Tags", text: $localRecipesViewModel.strTags)
                }

            }

            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.titleOnly)
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        let newRecipe = localRecipesViewModel.createNewrecipe()
                        model.appendLocal(newRecipe)
                        onDismiss()
                        presentationMode.wrappedValue.dismiss()

                    } label: {
                        Label("Save", systemImage: "checkmark")
                            .labelStyle(.titleOnly)
                    }

                }
            }.navigationBarTitle("New Recipe", displayMode: .inline)
        }
    }
}
