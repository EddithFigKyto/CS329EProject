//
//  filterPopUpViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 11/26/22.
//

import UIKit

// to store temporary diet filters
var tempDietFilters = [Recipe.diet]()

// to store temporary dish filters
var tempDishFilters = [Recipe.dishType]()

class filterPopUpViewController: UIViewController {
    // all of the follow label/switch pairs correspond to a switch elements that can filter the recipes in allCookbookRecipesVC
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
    
    @IBOutlet weak var mainDishLabel: UILabel!
    @IBOutlet weak var mainDishSwitch: UISwitch!
    
    @IBOutlet weak var saladLabel: UILabel!
    @IBOutlet weak var saladSwitch: UISwitch!
    
    @IBOutlet weak var drinksLabel: UILabel!
    @IBOutlet weak var drinksSwitch: UISwitch!
    
    @IBOutlet weak var sidesLabel: UILabel!
    @IBOutlet weak var sidesSwitch: UISwitch!
    
    @IBOutlet weak var dessertsLabel: UILabel!
    @IBOutlet weak var dessertsSwitch: UISwitch!
    
    // allows allCookbookRecipesVC to be the delegate so the filter lists can be passed back to it
    var delegate: UIViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // implement user defaults font settings
        vegetarianLabel.font = UIFont(name: fontSet!, size: 18)
        veganLabel.font = UIFont(name: fontSet!, size: 18)
        glutenFreeLabel.font = UIFont(name: fontSet!, size: 18)
        nutFreeLabel.font = UIFont(name: fontSet!, size: 18)
        halalLabel.font = UIFont(name: fontSet!, size: 18)
        mainDishLabel.font = UIFont(name: fontSet!, size: 18)
        saladLabel.font = UIFont(name: fontSet!, size: 18)
        drinksLabel.font = UIFont(name: fontSet!, size: 18)
        sidesLabel.font = UIFont(name: fontSet!, size: 18)
        dessertsLabel.font = UIFont(name: fontSet!, size: 18)
        
        // initialize switch as on/off depending on whether the corresponding filter is stored in the temporary arrays
        vegetarianSwitch.setOn(tempDietFilters.contains(Recipe.diet.vegetarian), animated: true)
        veganSwitch.setOn(tempDietFilters.contains(Recipe.diet.vegan), animated: true)
        glutenFreeSwitch.setOn(tempDietFilters.contains(Recipe.diet.gluten_free), animated: true)
        nutFreeSwitch.setOn(tempDietFilters.contains(Recipe.diet.nut_free), animated: true)
        halalSwitch.setOn(tempDietFilters.contains(Recipe.diet.halal), animated: true)
        mainDishSwitch.setOn(tempDishFilters.contains(Recipe.dishType.main), animated: true)
        saladSwitch.setOn(tempDishFilters.contains(Recipe.dishType.salad), animated: true)
        drinksSwitch.setOn(tempDishFilters.contains(Recipe.dishType.drinks), animated: true)
        sidesSwitch.setOn(tempDishFilters.contains(Recipe.dishType.side), animated: true)
        dessertsSwitch.setOn(tempDishFilters.contains(Recipe.dishType.dessert), animated: true)

    }
    
    // all switch functions either add or remove filters from the corresponding filters array depending on whether switch is turned on or off, respectively
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
    
    
    @IBAction func mainDishPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !tempDishFilters.contains(Recipe.dishType.main)
            {
                tempDishFilters.append(Recipe.dishType.main)
            }
        }
        else{
            tempDishFilters.remove(at: tempDishFilters.firstIndex(of: Recipe.dishType.main)!)
        }
    }
    
    @IBAction func saladsPressed(_ sender: UISwitch) {
        if sender.isOn == true{
            if !tempDishFilters.contains(Recipe.dishType.salad)
            {
                tempDishFilters.append(Recipe.dishType.salad)
            }
        }
        else{
            tempDishFilters.remove(at: tempDishFilters.firstIndex(of: Recipe.dishType.salad)!)
        }
    }
    
    @IBAction func drinksPressed(_ sender: UISwitch) {
        if sender.isOn == true{
            if !tempDishFilters.contains(Recipe.dishType.drinks)
            {
                tempDishFilters.append(Recipe.dishType.drinks)
            }
        }
        else{
            tempDishFilters.remove(at: tempDishFilters.firstIndex(of: Recipe.dishType.drinks)!)
        }
    }
    
    @IBAction func sidesPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !tempDishFilters.contains(Recipe.dishType.side)
            {
                tempDishFilters.append(Recipe.dishType.side)
            }
        }
        else{
            tempDishFilters.remove(at: tempDishFilters.firstIndex(of: Recipe.dishType.side)!)
        }
    }
    
    @IBAction func dessertsPressed(_ sender: UISwitch) {
        if sender.isOn == true{
            if !tempDishFilters.contains(Recipe.dishType.dessert)
            {
                tempDishFilters.append(Recipe.dishType.dessert)
            }
        }
        else{
            tempDishFilters.remove(at: tempDishFilters.firstIndex(of: Recipe.dishType.dessert)!)
        }
    }
    
    
    // once user applies the filter, the filteredRecipes array in allCookbookRecipesVC is changed to reflect filters
    @IBAction func applyFiltersPressed(_ sender: Any) {
        
        // otherVC is the allCookbookRecipesVC
        let otherVC = delegate as! filterProtocol
        
        // user the filter function in allCookbookRecipesVC to change the filteredRecipes array that's displayed to the user
        otherVC.filter(tempDietFilters: tempDietFilters, tempDishFilters: tempDishFilters)
        
        // dismiss the filterPopUpVC
        self.dismiss(animated: true)
    }
    
    
    

}

