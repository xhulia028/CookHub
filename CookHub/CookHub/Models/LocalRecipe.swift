//
//  LocalRecipe.swift
//  CookHub
//
//  Created by Xhulia Uni on 14.10.23.
//

import Foundation

class LocalRecipe{
    static var localId = -1
    var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
        LocalRecipe.localId += 1
    }
}
