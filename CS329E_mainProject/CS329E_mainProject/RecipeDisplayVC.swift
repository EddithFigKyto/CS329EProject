//
//  RecipeDisplayVC.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-26.
//

import UIKit

class RecipeDisplayVC: UIViewController {
    var saves1: Int = 0
    var creator1: String = ""
    var title1: String = ""
    //var ingredients1: [String] = []
    // array of strings which includes the measurement
    var ingredients1: String = ""
    // for filtering by ingredient only
    //var plainIngredients1: [String] = []
    var description1: String = "" //not [String] here 
    var stepList1: [String] = []
    var servingSize1: String = ""
    var cuisine1: String = ""
    //var dietaryRestr1: diet
    //var dish1: dishType
    var time1: String = ""//in min
    //var image: UIImage
    //var recipeImage1: String
    var tags1: String = ""
   
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var ingredTextView: UITextView!
    
    @IBOutlet weak var tagsTextView: UITextView!
    
    @IBOutlet weak var stepsTextView: UITextView!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextView.isEditable = false
        ingredTextView.isEditable = false
        titleLabel.text = title1
        descriptionTextView.text = description1
        ingredTextView.text = ingredients1
        tagsTextView.text = tags1
        //stepsTextView
   
    }
    

  
}
