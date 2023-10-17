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

                IngredientsAndInstructionsView(localRecipesViewModel: localRecipesViewModel)

                Section(header: CustomTextView( text: "Thumbnail URL")) {
                    TextField("Thumbnail URL", text: $localRecipesViewModel.strMealThumb)
                }
                Section(header: CustomTextView( text: "Additional Information")) {
                    TextField("Tags", text: $localRecipesViewModel.strTags)
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.titleOnly)
                    })
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button( action: {
                        let newRecipe = localRecipesViewModel.createNewrecipe()
                        model.appendLocal(newRecipe)
                        onDismiss()
                        presentationMode.wrappedValue.dismiss()}

                    , label: {
                        Label("Save", systemImage: "checkmark")
                            .labelStyle(.titleOnly)
                    })
                }
            }
            .navigationBarTitle("New Recipe", displayMode: .inline)
        }
    }
}
