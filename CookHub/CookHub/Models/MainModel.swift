import Foundation
import Observation
import os

let logger = Logger()

// The main model that gets passed around the app and holds the state of the fetched recipes and the local recipes
// It also enables the user to fetch more recipes if wished
// Filters the liked recipes from the fetched recipes, to preview to the user
// handles the fetching of recipes and parsing of the JSON returned from the API

@Observable  class MainModel {
    var localRecipes: [Recipe] = []
    var loadMore = false
    var recipes: [Recipe] = []
    var likedRecipes: [Recipe] {
        return recipes.filter { $0.isLiked }
    }

    func fetchRecipes () async {
        let recipesToAppend = await populateRecipes(numb: 3)
        recipes.append(contentsOf: recipesToAppend)
    }

    func appendLocal(_ value: Recipe) {
        localRecipes.append(value)
    }

    func isLocalrecipesEmpty() -> Bool {
        return localRecipes.isEmpty
    }

    func populateRecipes(numb: Int) async -> [Recipe] {
        var recipes: [Recipe] = []
        for _ in 1...numb {
            if let fetchedRecipe = await fetchData() {
                let recipe = Recipe(recipe: fetchedRecipe)
                recipes.append(recipe)
            }
        }
        return recipes
    }

    func fetchData() async -> RecipeA? {
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
            if let recipe: RecipeA = decodedData.meals.first {
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
