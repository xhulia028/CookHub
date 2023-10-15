//
//  MealViewMode.swift
//  CookHub
//
//  Created by Xhulia Uni on 12.10.23.
//

import Foundation
import os

enum BadRequestError: Error {
    case badRequest
}

class RecipeViewModel: ObservableObject {
    //    @Published var recipe: Recipe?
    
    //    init() {
    //        Task.init {
    //            await fetchData()
    //        }
    //    }
    let logger = Logger()
    
    func fetchData() async -> Recipe? {
 
            do {
                guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php") else { fatalError("Missing URL") }
                
                let urlRequest = URLRequest(url: url)
                
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
                guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let decodedData = try decoder.decode(RecipeResponse.self, from: data)
                logger.info("Success")
                if let r: RecipeA = decodedData.meals.first {
                    let recipe = Recipe().populateRecipe(idMeal: r.idMeal, strMeal: r.strMeal, strCategory: r.strCategory, strArea: r.strArea, strInstructions: r.strInstructions, strMealThumb: r.strMealThumb, strTags: r.strTags, ingredients: r.getIngredients(), measurements: r.getMeasurements())
                    return recipe
                }
                else {
                    return nil
                }
                
                

            } catch {
                logger.info("Error fetching data from Pexels: \(error)")
                return nil
            }
    
        }
    }
    



