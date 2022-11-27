//
//  RecipeCreateViewController.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-09.
//

import UIKit

var titleList = ["Title", "Cook Time", "Serving Size"]
var nextList = ["Next: Cook Time", "Next: Serving Size", "Next: Description"]

var indexVC = 0

// had to create a version of this with the additonal properties so app would not break - Laynee
var creatingRecipe = Recipe(creator: "", title: "", ingredients: [], printIngredients: [], plainIngredients: [], servingSize: "", cuisine: "", description: [], dietaryRestriction: .none, dish: .unselected, stepList: [], time: "", tags: [], recipeImage: "", timersList: [])

//var creatingRecipe = Recipe(creator: "", title: "", ingredients: [], servingSize: "", cuisine: "", description: [], dietaryRestriction: .none, dish: .unselected, time: "")



class RecipeCreateViewController: UIViewController {

    @IBOutlet weak var titleName: UILabel!
    @IBOutlet weak var nextName: UIButton!
    @IBOutlet weak var textfield: UITextField!
    
    @IBAction func nextButton(_ sender: Any) {
        indexVC += 1
        titleName.text = titleList[indexVC]
        nextName.setTitle(nextList[indexVC], for: .normal)
        if indexVC == 2{
            //segue here
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if indexVC == 2{
            if segue.identifier == "NextIngredient", //comma implies sequencing
               let nextVC = segue.destination as? RecipeCreationVC2{ //pointer to 2nd VC
                nextVC.delegate = self
            }
            
            
        }

    }
    
    
    @IBAction func savePressed(_ sender: Any) {
        if indexVC == 0{
            creatingRecipe.title =  textfield.text!
        }else if indexVC == 1{
            creatingRecipe.time =  textfield.text!
        }else if indexVC == 2{
            creatingRecipe.servingSize =  textfield.text!
        }else{
            print("this should not happen")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indexVC = 0
        titleName.text = titleList[indexVC]
        nextName.setTitle(nextList[indexVC], for: .normal)
        
    }
    

 
}
