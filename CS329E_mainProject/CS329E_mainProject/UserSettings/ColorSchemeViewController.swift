//
//  ColorSchemeViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/18/22.
//

import UIKit

public var colorSet = userCustomizations.string(forKey: "color")



let colors = ["cyan", "pink", "black", "purple", "green"]

class ColorSchemeViewController: UIViewController {
    
    @IBOutlet weak var colorSchemeTextDisplay: UILabel!
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var cyanSwitch: UISwitch!
    @IBOutlet weak var cyanLabel: UILabel!
    
    @IBOutlet weak var pinkSwitch: UISwitch!
    @IBOutlet weak var pinkLabel: UILabel!
    
    
    @IBOutlet weak var blackSwitch: UISwitch!
    @IBOutlet weak var blackLabel: UILabel!
    
    @IBOutlet weak var purpleSwitch: UISwitch!
    @IBOutlet weak var purpleLabel: UILabel!
    
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var greenLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorSchemeTextDisplay.font = UIFont(name: fontSet!, size: 18)
        colorSchemeTextDisplay.textColor = chosenColor
        
        cyanLabel.font = UIFont(name: fontSet!, size: 18)
        cyanLabel.textColor = UIColor.systemCyan
        
        pinkLabel.font = UIFont(name: fontSet!, size: 18)
        pinkLabel.textColor = UIColor.systemPink
        
        blackLabel.font = UIFont(name: fontSet!, size: 18)
        blackLabel.textColor = UIColor.black
        
        purpleLabel.font = UIFont(name: fontSet!, size: 18)
        purpleLabel.textColor = UIColor.purple
        
        greenLabel.font = UIFont(name: fontSet!, size: 18)
        greenLabel.textColor = UIColor.systemGreen
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        colorSchemeTextDisplay.font = UIFont(name: fontSet!, size: 18)
        colorSchemeTextDisplay.textColor = chosenColor
        
        
        cyanLabel.font = UIFont(name: fontSet!, size: 18)
        cyanLabel.textColor = UIColor.cyan
        
        pinkLabel.font = UIFont(name: fontSet!, size: 18)
        pinkLabel.textColor = UIColor.systemPink
        
        blackLabel.font = UIFont(name: fontSet!, size: 18)
        blackLabel.textColor = UIColor.black
        
        purpleLabel.font = UIFont(name: fontSet!, size: 18)
        purpleLabel.textColor = UIColor.purple
        
        greenLabel.font = UIFont(name: fontSet!, size: 18)
        greenLabel.textColor = UIColor.green
        
        
        let index = colors.firstIndex(of: colorSet!)
        cyanSwitch.setOn(0 == index, animated: true)
        pinkSwitch.setOn(1 == index, animated: true)
        blackSwitch.setOn(2 == index, animated: true)
        purpleSwitch.setOn(3 == index, animated: true)
        greenSwitch.setOn(4 == index, animated: true)
        
    }
    
    @IBAction func cyanPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            
            chosenColor = UIColor.systemCyan
            
            userCustomizations.set(colors[0], forKey: "color")
            colorSet = userCustomizations.string(forKey: "color")
            pinkSwitch.setOn(false, animated: true)
            blackSwitch.setOn(false, animated: true)
            purpleSwitch.setOn(false, animated: true)
            greenSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
    
    
    
    @IBAction func pinkPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            
            chosenColor = UIColor.systemPink
            userCustomizations.set(colors[1], forKey: "color")
            colorSet = userCustomizations.string(forKey: "color")
            cyanSwitch.setOn(false, animated: true)
            blackSwitch.setOn(false, animated: true)
            purpleSwitch.setOn(false, animated: true)
            greenSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
        
        
    @IBAction func blackPressed(_ sender: UISwitch) {
        if sender.isOn == true{
            chosenColor = UIColor.black
            userCustomizations.set(colors[2], forKey: "color")
            colorSet = userCustomizations.string(forKey: "color")
            cyanSwitch.setOn(false, animated: true)
            pinkSwitch.setOn(false, animated: true)
            purpleSwitch.setOn(false, animated: true)
            greenSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
    
    @IBAction func purplePressed(_ sender: UISwitch) {
        if sender.isOn == true{
            chosenColor = UIColor.systemPurple
            userCustomizations.set(colors[3], forKey: "color")
            colorSet = userCustomizations.string(forKey: "color")
            cyanSwitch.setOn(false, animated: true)
            pinkSwitch.setOn(false, animated: true)
            blackSwitch.setOn(false, animated: true)
            greenSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
        
    }
    
        
    @IBAction func greenPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            chosenColor = UIColor.systemGreen
            userCustomizations.set(colors[4], forKey: "color")
            colorSet = userCustomizations.string(forKey: "color")
            cyanSwitch.setOn(false, animated: true)
            pinkSwitch.setOn(false, animated: true)
            blackSwitch.setOn(false, animated: true)
            purpleSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
    
    
    

}
