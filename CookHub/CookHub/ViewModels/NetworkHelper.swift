//
//  MealViewMode.swift
//  CookHub
//
//  Created by Xhulia Uni on 12.10.23.
//

import Foundation
import os
import Observation

enum BadRequestError: Error {
    case badRequest
}

@Observable class NetworkHelper {
    //    @Published var recipe: Recipe?

    //    init() {
    //        Task.init {
    //            await fetchData()
    //        }
    //    }
    let logger = Logger()

    func fetchData() async -> Recipe? {
        do {
            guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")
            else { fatalError("Missing URL") }

            let urlRequest = URLRequest(url: url)

            let (data, response) = try await URLSession.shared.data(for: urlRequest)

            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }

            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let decodedData = try decoder.decode(RecipeResponse.self, from: data)
            logger.info("Success")
            if let decodedRecipe: RecipeA = decodedData.meals.first {
                let recipe = Recipe(recipe: decodedRecipe)
                return recipe
            } else {
                return nil
            }
        } catch {
            logger.info("Error fetching data from Pexels: \(error)")
            return nil
        }
    }
}
