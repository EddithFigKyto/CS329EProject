//
//  InitialDietViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/25/22.
//

import UIKit

class InitialDietViewController: UIViewController {
    
    
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var selectAllApplyLabel: UILabel!
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var veganLabel: UILabel!
    @IBOutlet weak var glutenFreeLabel: UILabel!
    @IBOutlet weak var nutFreeLabel: UILabel!
    @IBOutlet weak var halalLabel: UILabel!
    
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    @IBOutlet weak var veganSwitch: UISwitch!
    @IBOutlet weak var glutenFreeSwitch: UISwitch!
    @IBOutlet weak var nutFreeSwitch: UISwitch!
    @IBOutlet weak var halalSwitch: UISwitch!
    
    var initialDietChoices:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        instructionsLabel.font = UIFont(name: "Avenir Next", size: 18)
        selectAllApplyLabel.font = UIFont(name: "Avenir Next", size: 18)
        vegetarianLabel.font = UIFont(name: "Avenir Next", size: 18)
        veganLabel.font = UIFont(name: "Avenir Next", size: 18)
        glutenFreeLabel.font = UIFont(name: "Avenir Next", size: 18)
        nutFreeLabel.font = UIFont(name: "Avenir Next", size: 18)
        halalLabel.font = UIFont(name: "Avenir Next", size: 18)
        
    }
    
    @IBAction func vegetarianSelected(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !initialDietChoices.contains("vegetarian")
            {
                initialDietChoices.append("vegetarian")
            }
        }
        else{
            initialDietChoices.remove(at: initialDietChoices.firstIndex(of: "vegetarian")!)
        }
        
        userCustomizations.set(initialDietChoices, forKey: "diet")
        initialDietChoices = (userCustomizations.array(forKey: "diet") as? [String])!
    }
    
    @IBAction func veganSelected(_ sender: UISwitch) {
        if sender.isOn == true{
            if !initialDietChoices.contains("vegan")
            {
                initialDietChoices.append("vegan")
            }
        }
        else{
            initialDietChoices.remove(at: initialDietChoices.firstIndex(of: "vegan")!)
        }
        
        userCustomizations.set(initialDietChoices, forKey: "diet")
        initialDietChoices = (userCustomizations.array(forKey: "diet") as? [String])!
    }
    
    @IBAction func glutenFreeSelected(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !initialDietChoices.contains("gluten-free")
            {
                initialDietChoices.append("gluten-free")
            }
        }
        else{
            initialDietChoices.remove(at: initialDietChoices.firstIndex(of: "gluten-free")!)
        }
        
        userCustomizations.set(initialDietChoices, forKey: "diet")
        initialDietChoices = (userCustomizations.array(forKey: "diet") as? [String])!
    }
    
    @IBAction func nutFreeSelected(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !initialDietChoices.contains("nut-free")
            {
                initialDietChoices.append("nut-free")
            }
        }
        else{
            initialDietChoices.remove(at: initialDietChoices.firstIndex(of: "nut-free")!)
        }
        
        userCustomizations.set(initialDietChoices, forKey: "diet")
        initialDietChoices = (userCustomizations.array(forKey: "diet") as? [String])!
    }
    
    @IBAction func halalSelected(_ sender: UISwitch) {
        if sender.isOn == true{
            if !initialDietChoices.contains("halal")
            {
                initialDietChoices.append("halal")
            }
        }
        else{
            initialDietChoices.remove(at: initialDietChoices.firstIndex(of: "halal")!)
        }
        
        userCustomizations.set(initialDietChoices, forKey: "diet")
        initialDietChoices = (userCustomizations.array(forKey: "diet") as? [String])!
        
    }
    

}
