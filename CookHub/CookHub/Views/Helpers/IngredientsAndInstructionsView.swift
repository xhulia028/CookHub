//
//  IngredientsAndInstructionsView.swift
//  CookHub
//
//  Created by Xhulia Uni on 17.10.23.
//

import SwiftUI

struct IngredientsAndInstructionsView: View {
    @State var localRecipesViewModel: LocalRecipesViewModel
    var body: some View {
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
                }, label: {
                    CustomTextView( text: "Add Ingredient")
                })
            }
        }
        Section(header: CustomTextView( text: "Thumbnail URL")) {
            TextField("Thumbnail URL", text: $localRecipesViewModel.strMealThumb)
        }
    }
}
