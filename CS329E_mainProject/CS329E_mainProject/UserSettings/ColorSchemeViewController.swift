//
//  ColorSchemeViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/18/22.
//

import UIKit

public var colorSet = userCustomizations.string(forKey: "color")

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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
    }
    
    @IBAction func pinkPressed(_ sender: UISwitch) {
    }
    
    @IBAction func cyanPressed(_ sender: UISwitch) {
    }
    
    @IBAction func blackPressed(_ sender: UISwitch) {
    }
    
    @IBAction func purplePressed(_ sender: UISwitch) {
    }
    
    @IBAction func greenPressed(_ sender: UISwitch) {
    }
    
    

}
