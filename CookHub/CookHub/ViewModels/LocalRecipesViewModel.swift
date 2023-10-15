//
//  LocalRecipesViewModel.swift
//  CookHub
//
//  Created by Xhulia Uni on 14.10.23.
//

import Foundation

class LocalRecipesViewModel: ObservableObject {
    @Published var localRecipes: [Recipe] = []
    
    func appendLocal(_ value: Recipe) {
            localRecipes.append(value)
        }
}
