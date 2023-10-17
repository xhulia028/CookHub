import Foundation
import Observation

// The API returns an array with one element, which represents a meal/recipe
struct RecipeResponse: Codable {
    var meals: [RecipeA]
}

// The model for the recipe that gets used throughout the app,
// Contains extra fields like isLiked or isLocal
// isLiked -> handles liked recipes
// isLocal -> hides the like button for local recipes

@Observable class Recipe {
    var recipeInstance: RecipeA
    var isLiked = false
    var isLocal = false
    var ingredients: [String] = []
    var measurements: [String] = []
    
    init(recipe: RecipeA) {
        self.recipeInstance = recipe
        self.ingredients = recipe.getIngredients()
        self.measurements = recipe.getMeasurements()
    }
    
    init(idMeal: String,
         strMeal: String,
         strCategory: String,
         strArea: String,
         strInstructions: String,
         strMealThumb: String,
         strTags: String,
         isLiked: Bool = false,
         isLocal: Bool = false,
         ingredients: [String],
         measurements: [String]) {
        self.recipeInstance = RecipeA()
        self.recipeInstance.idMeal = idMeal
        self.recipeInstance.strMeal = strMeal
        self.recipeInstance.strCategory = strCategory
        self.recipeInstance.strArea = strArea
        self.recipeInstance.strInstructions = strInstructions
        self.recipeInstance.strMealThumb = strMealThumb
        self.recipeInstance.strTags = strTags
        self.recipeInstance = recipeInstance
        self.isLiked = isLiked
        self.isLocal = isLocal
        self.ingredients = ingredients
        self.measurements = measurements
    }
    
    var getIdMeal: String {
        return self.recipeInstance.idMeal
    }
    
    var getStrMeal: String {
        return self.recipeInstance.strMeal
    }
    
    var getStrCategory: String {
        return self.recipeInstance.strCategory
    }
    
    var getStrArea: String {
        return self.recipeInstance.strArea
    }
    
    var getStrInstructions: String {
        return self.recipeInstance.strInstructions
    }
    
    var getStrMealThumb: String {
        return self.recipeInstance.strMealThumb
    }
    
    var getStrTags: String {
        return self.recipeInstance.strTags
    }
}

// What the api actually returns

struct RecipeA: Codable {
    var idMeal = ""
    var strMeal = ""
    var strCategory = ""
    var strArea = ""
    var strInstructions = ""
    var strMealThumb = ""
    var strTags = ""
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
    
    func getIngredients() -> [String] {return
        [
            strIngredient1, strIngredient2, strIngredient3, strIngredient4,
            strIngredient5, strIngredient6, strIngredient7, strIngredient8, strIngredient9,
            strIngredient10, strIngredient11, strIngredient12, strIngredient13, strIngredient14,
            strIngredient15, strIngredient16, strIngredient17, strIngredient18, strIngredient19, strIngredient20
        ]
    }
    
    func getMeasurements() -> [String] {return
        [
            strMeasure1, strMeasure2, strMeasure3, strMeasure4, strMeasure5,
            strMeasure6, strMeasure7, strMeasure8, strMeasure9, strMeasure10,
            strMeasure11, strMeasure12, strMeasure13, strMeasure14, strMeasure15, strMeasure16,
            strMeasure17, strMeasure18, strMeasure19, strMeasure20
        ]
    }
}
