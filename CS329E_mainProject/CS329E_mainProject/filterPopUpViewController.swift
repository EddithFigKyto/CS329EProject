//
//  filterPopUpViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 11/26/22.
//

import UIKit

// to store diet filters
var tempDietFilters = [Recipe.diet]()

class filterPopUpViewController: UIViewController {
    
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    
    @IBOutlet weak var veganLabel: UILabel!
    @IBOutlet weak var veganSwitch: UISwitch!
    
    @IBOutlet weak var glutenFreeLabel: UILabel!
    @IBOutlet weak var glutenFreeSwitch: UISwitch!
   
    @IBOutlet weak var nutFreeSwitch: UISwitch!
    @IBOutlet weak var nutFreeLabel: UILabel!
    
    @IBOutlet weak var halalLabel: UILabel!
    @IBOutlet weak var halalSwitch: UISwitch!
    
    var delegate: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        vegetarianLabel.font = UIFont(name: fontSet!, size: 18)
        veganLabel.font = UIFont(name: fontSet!, size: 18)
        glutenFreeLabel.font = UIFont(name: fontSet!, size: 18)
        nutFreeLabel.font = UIFont(name: fontSet!, size: 18)
        halalLabel.font = UIFont(name: fontSet!, size: 18)
        
        // initialize switch as on/off depending on whether the corresponding filter is stored in the temporary arrays
        vegetarianSwitch.setOn(tempDietFilters.contains(Recipe.diet.vegetarian), animated: true)
        veganSwitch.setOn(tempDietFilters.contains(Recipe.diet.vegan), animated: true)
        glutenFreeSwitch.setOn(tempDietFilters.contains(Recipe.diet.gluten_free), animated: true)
        nutFreeSwitch.setOn(tempDietFilters.contains(Recipe.diet.nut_free), animated: true)
        halalSwitch.setOn(tempDietFilters.contains(Recipe.diet.halal), animated: true)
        
        


    }
    
    // all switch functions either add or remove filters depending on whether switch is on/off
    @IBAction func vegetarianPressed(_ sender: UISwitch) {
        if sender.isOn == true{
            if !tempDietFilters.contains(Recipe.diet.vegetarian)
            {
                tempDietFilters.append(Recipe.diet.vegetarian)
            }
        }
        else{
            tempDietFilters.remove(at: tempDietFilters.firstIndex(of: Recipe.diet.vegetarian)!)
        }
    }
    
    @IBAction func veganPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !tempDietFilters.contains(Recipe.diet.vegan)
            {
                tempDietFilters.append(Recipe.diet.vegan)
            }
        }
        else{
            tempDietFilters.remove(at: tempDietFilters.firstIndex(of: Recipe.diet.vegan)!)
        }
        


    }
    
    @IBAction func glutenFreePressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !tempDietFilters.contains(Recipe.diet.gluten_free)
            {
                tempDietFilters.append(Recipe.diet.gluten_free)
            }
        }
        else{
            tempDietFilters.remove(at: tempDietFilters.firstIndex(of: Recipe.diet.gluten_free)!)
        }
        
    }
    
    @IBAction func nutFreePressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !tempDietFilters.contains(Recipe.diet.nut_free)
            {
                tempDietFilters.append(Recipe.diet.nut_free)
            }
        }
        else{
            tempDietFilters.remove(at: tempDietFilters.firstIndex(of: Recipe.diet.nut_free)!)
        }

    }

    @IBAction func halalPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !tempDietFilters.contains(Recipe.diet.halal)
            {
                tempDietFilters.append(Recipe.diet.halal)
            }
        }
        else{
            tempDietFilters.remove(at: tempDietFilters.firstIndex(of: Recipe.diet.halal)!)
        }
    }
    
    // once user applies the filter, the filteredRecipes array in allCookbookRecipesVC is changed to reflect filters
    @IBAction func applyFiltersPressed(_ sender: Any) {
        let otherVC = delegate as! filterProtocol
        otherVC.filter(tempDietFilters: tempDietFilters)
        self.dismiss(animated: true)
    }
    

}
