//
//  RecipeDisplayVC.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-26.
//

import UIKit

class RecipeDisplayVC: UIViewController, DisplayRecipe {
    
    
   
    @IBOutlet weak var titleLabel: UILabel!
    
  
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var ingredTextView: UITextView!
    
    @IBOutlet weak var tagsTextView: UITextView!
    
    @IBOutlet weak var stepsTextView: UITextView!
    
    func sendAllInfo(someRecipe: Recipe) {
        titleLabel.text = someRecipe.title
        descriptionTextView.text = someRecipe.description[0]
        ingredTextView.text = someRecipe.printIngredients.joined(separator: "\n")
        tagsTextView.text = someRecipe.tags.joined(separator: ", ")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.isEditable = false
        ingredTextView.isEditable = false

   
    }
    

  
}
