//
//  RecipeClass .swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-02.
//

import Foundation
import UIKit

var userSavedRecipes = [Recipe]()

class Recipe {
    
    var saves: Int = 0
    var creator: String = ""
    var title: String = ""
    var ingredients: [String] = []
    // array of strings which includes the measurement
    var printIngredients: [String] = []
    // for filtering by ingredient only
    var plainIngredients: [String] = []
    var description: [String] = [] //my bad
    var stepList: [String] = []
    var timersList: [Int] = []  //in seconds // length is same as stepList // 0 means no timer 
    var servingSize: String = ""
    var cuisine: String = ""
    var dietaryRestr: diet
    var dish: dishType
    var time: String //in min
    //var image: UIImage
    var recipeImage: String
    var tags: [String] = []

    
    init(creator: String,
         title: String,
         ingredients: [String],
         printIngredients: [String],
         plainIngredients: [String],
         servingSize: String,
         cuisine: String,
         description: [String],
         dietaryRestriction: diet,
         dish: dishType,
         stepList: [String],
         time: String,
         tags: [String],
         recipeImage: String,
         timersList: [Int]
         //,
         //image: UIImage
    ) {
        
        self.creator = creator
        self.title = title
        self.ingredients = ingredients
        self.printIngredients = printIngredients
        self.plainIngredients = plainIngredients
        self.servingSize = servingSize
        self.cuisine = cuisine //Mexican, Indian, Chinese, French, Italian, American,
        self.description = description
        self.dietaryRestr = dietaryRestriction
        self.dish = dish
        self.time = time
        self.stepList = stepList
        self.recipeImage = recipeImage
        //self.image = image
    }
    
    enum dishType: String{
        case main = "Main",
             dessert = "Dessert",
             side = "Side",
             salad = "Salad",
             sauce = "Sauce",
             drinks = "Drinks",
             unselected = ""
     
    }
    enum diet: String {
        case vegetarian = "Vegetarian",
             vegan = "Vegan",
             gluten_free = "Gluten Free",
             sugar_free = "Sugar Free",
             lactose_free = "Lactose Free",
             nut_free = "Nut Free",
             none = "",
             halal = "Halal"
    }
    func addStep(step: String) {
        self.stepList.append(step)
    }
    func addIngredient(ingredient: String){
        self.ingredients.append(ingredient)
    }
    func addSave(){
        self.saves += 1
    }
    func addTags(tag: String){
        self.tags.append(tag)
    }
    //can implement countdown timer function for each recipe -> use multithreaded programming
}
