//
//  RecipeCreationVC2.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-09.
//

import UIKit

class RecipeCreationVC2: UIViewController {
    var delegate: UIViewController!
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var recipeTitle: UILabel! //need to send recipe title from previous VC (maybe make a list of variables or dictionary situation)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.isEditable = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MeasurementSeg", //comma implies sequencing
           let nextVC = segue.destination as? MeasurementVC{ //pointer to 2nd VC
            nextVC.delegate = self
        }
    }
}
