//
//  Meal.swift
//  CookHub
//
//  Created by Xhulia Uni on 12.10.23.
//

import Foundation

struct RecipeResponse: Codable {
    var meals: [Recipe]
}

struct Recipe: Codable {
    var idMeal: String
    var strMeal: String
    var strCategory: String
    var strArea: String
    var strInstructions: String
    var strMealThumb: String
    var strTags = ""
    var strYoutube: String
    private var strIngredient1 = ""
    private var strIngredient2 = ""
    private var strIngredient3 = ""
    private var strIngredient4 = ""
    private var strIngredient5 = ""
    private var strIngredient6 = ""
    private var strIngredient7 = ""
    private var strIngredient8 = ""
    private var strIngredient9 = ""
    private var strIngredient10 = ""
    private var strIngredient11 = ""
    private var strIngredient12 = ""
    private var strIngredient13 = ""
    private var strIngredient14 = ""
    private var strIngredient15 = ""
    private var strIngredient16 = ""
    private var strIngredient17 = ""
    private var strIngredient18 = ""
    private var strIngredient19 = ""
    private var strIngredient20 = ""
    private var strMeasure1 = ""
    private var strMeasure2 = ""
    private var strMeasure3 = ""
    private var strMeasure4 = ""
    private var strMeasure5 = ""
    private var strMeasure6 = ""
    private var strMeasure7 = ""
    private var strMeasure8 = ""
    private var strMeasure9 = ""
    private var strMeasure10 = ""
    private var strMeasure11 = ""
    private var strMeasure12 = ""
    private var strMeasure13 = ""
    private var strMeasure14 = ""
    private var strMeasure15 = ""
    private var strMeasure16 = ""
    private var strMeasure17 = ""
    private var strMeasure18 = ""
    private var strMeasure19 = ""
    private var strMeasure20 = ""
    
    func getIngredients() -> [String]{return
        [strIngredient1, strIngredient2, strIngredient3, strIngredient4, strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9, strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14, strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20]
    }
    
    func getMeasurements() -> [String]{return
        [strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5, strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10, strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16, strIngredient17, strIngredient18, strIngredient19, strIngredient20]
    }
}


