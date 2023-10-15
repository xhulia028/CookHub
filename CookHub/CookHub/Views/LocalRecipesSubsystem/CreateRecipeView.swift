//
//  CreateRecipeView.swift
//  CookHub
//
//  Created by Xhulia Uni on 14.10.23.
//

import SwiftUI
import AlertToast

struct CreateRecipeView: View {
    @EnvironmentObject var localRecipesViewModel: LocalRecipesViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var strMeal: String = ""
    @State private var strCategory: String = ""
    @State private var strArea: String = ""
    @State private var strInstructions: String = ""
    @State private var strMealThumb: String = ""
    @State private var strTags: String = ""
    @State private var ingredients: [String] = [""]
    @State private var measurements: [String] = [""]
    
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    var onDismiss: () -> Void
    
    var body: some View {
        
        NavigationView{
            Form {
                Section(header: CustomTextView( text:"Recipe Details")) {
                    TextField("Meal Name", text: $strMeal)
                    TextField("Category", text: $strCategory)
                    TextField("Area", text: $strArea)
                }
                
                Section(header: CustomTextView( text:"Instructions")) {
                    TextEditor(text: $strInstructions)
                        .frame(minHeight: 200)
                }
                
                Section(header: CustomTextView( text:"Ingredients")) {
                    ForEach(ingredients.indices, id: \.self) { index in
                        
                        IngredientView(ingredient: $ingredients[index], amount: $measurements[index])
                        {
                            ingredients.remove(at: index)
                            measurements.remove(at: index)
                        }
                        
                        
                    }
                    if ingredients.count < 20 {
                        
                        Button(action: {
                            ingredients.append("")
                            measurements.append("")
                        }) {
                            CustomTextView( text:"Add Ingredient")
                        }
                    }
                }
                    
                
                Section(header: CustomTextView( text:"Thumbnail URL")) {
                    TextField("Thumbnail URL", text: $strMealThumb)
                }
                
                Section(header: CustomTextView( text:"Additional Information")) {
                    TextField("Tags", text: $strTags)
                }
                
            }
            
            .toolbar {
                ToolbarItem(placement: .cancellationAction){
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.titleOnly)
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button {
                        let img = strMealThumb != "" ? strMealThumb: "https://st2.depositphotos.com/2586633/46477/v/450/depositphotos_464771766-stock-illustration-no-photo-or-blank-image.jpg"
                        var newRecipe = Recipe().populateRecipe(idMeal: "", strMeal: strMeal, strCategory: strCategory, strArea: strArea, strInstructions: strInstructions, strMealThumb: img, strTags: strTags, ingredients: ingredients, measurements: measurements)
                        newRecipe.isLocal = true
                        localRecipesViewModel.appendLocal(newRecipe)
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

