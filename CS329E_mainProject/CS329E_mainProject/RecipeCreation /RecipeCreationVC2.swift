//
//  RecipeCreationVC2.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-09.
//

import UIKit

class RecipeCreationVC2: UIViewController {
    var delegate: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textView.editable = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MeasurementSeg", //comma implies sequencing
           let nextVC = segue.destination as? MeasurementVC{ //pointer to 2nd VC
            nextVC.delegate = self
        }
    }
}
