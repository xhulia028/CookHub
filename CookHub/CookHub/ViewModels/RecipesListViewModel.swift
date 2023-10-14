//
//  RecepieListViewModel.swift
//  CookHub
//
//  Created by Xhulia Uni on 14.10.23.
//

import Foundation

class RecipesListViewModel: ObservableObject {
//    var recipes: [Recipe] = [
//    Recipe
//    ]
//    init() {
//        recipes = await populateRecipes()
//    }
        
    func populateRecipes() async -> [Recipe] {
        var recipes: [Recipe] = []
        let recipeViewModel = RecipeViewModel()
        for _ in 0...5 {
            if let recipe = await recipeViewModel.fetchData(){
               recipes.append(recipe)
            }
           
        }
        return recipes
    }
}
