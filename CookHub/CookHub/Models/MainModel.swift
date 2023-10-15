//
//  MainModel.swift
//  CookHub
//
//  Created by Xhulia Uni on 15.10.23.
//

import Foundation

class MainModel {
    let recipesListViewModel = RecipesListViewModel()
    let localRcipesViewModel = LocalRecipesViewModel()
    var recipes: [Recipe] = []
    
    func fetchRecipes () async -> Void {
        recipes = await recipesListViewModel.populateRecipes()
    }
    
   
    
}
