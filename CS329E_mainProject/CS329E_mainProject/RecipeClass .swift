//
//  RecipeClass .swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-02.
//

import Foundation
import UIKit



class Recipe{
    var saves: Int = 0
    var creator: String = ""
    var title: String = ""
    var ingredients: [String] = []
    var description: [String] = [] //my bad
    var stepList: [String] = []
    var servingSize: Int = 0
    var cuisine: String = ""
    var dietaryRestr: diet
    var dish: dishType
    var time: Int = 0 //in min
    var image: UIImage
    var tags: [String] = []
    
    init(creator: String,
         title: String,
         ingredients: [String],
         servingSize: Int,
         cuisine: String,
         description: [String],
         dietaryRestriction: diet,
         dish: dishType,
         time: Int,
         image: UIImage) {
        
        self.creator = creator
        self.title = title
        self.ingredients = ingredients
        self.servingSize = servingSize
        self.cuisine = cuisine //Mexican, Indian, Chinese, French, Italian, American,
        self.description = description
        self.dietaryRestr = dietaryRestriction
        self.dish = dish
        self.time = time
        self.image = image
    }
    
    enum dishType{
        case main, dessert, side, salad, sauce, drinks
    }
    enum diet{
        case vegetarian, vegan, gluten_free, sugar_free, lactose_free, nut_free, none
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
