import Foundation
import Observation

/**
 Overal Viewmodel of the Localrecipes
 Used when the user wants to create a local recipe
 The input from the user gets save in this model
 */

@Observable class LocalRecipesViewModel {
    var strMeal: String = ""
    var strCategory: String = ""
    var strArea: String = ""
    var strInstructions: String = ""
    var strMealThumb: String = ""
    var strTags: String = ""
    var ingredients: [String] = [""]
    var measurements: [String] = [""]
    var navigateToRecipe = false

    func createNewrecipe() -> Recipe {
        let newRecipe = Recipe(
            idMeal: "",
            strMeal: strMeal,
            strCategory: strCategory,
            strArea: strArea,
            strInstructions: strInstructions,
            strMealThumb: strMealThumb,
            strTags: strTags,
            ingredients: ingredients,
            measurements: measurements)
        newRecipe.isLocal = true
        return newRecipe
    }
}
