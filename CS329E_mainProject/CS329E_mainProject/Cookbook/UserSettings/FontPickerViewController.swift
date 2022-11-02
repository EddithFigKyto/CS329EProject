//
//  FontPickerViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 10/30/22.
//

import UIKit

let font = ["Avenir Next", "American Typewriter", "Menlo-Regular", "Papyrus"]

public var fontSet = font[0]

class FontPickerViewController: UIViewController {
    
    @IBOutlet weak var fontDisplay: UILabel!
    
    
    @IBOutlet weak var AvenirNextLabel: UILabel!
    @IBOutlet weak var AvenirNextSwitch: UISwitch!
    
    
    @IBOutlet weak var AmericanTypewriterLabel: UILabel!
    @IBOutlet weak var AmericanTypewriterSwitch: UISwitch!
    
    
    @IBOutlet weak var MenloRegularLabel: UILabel!
    @IBOutlet weak var MenloRegularSwitch: UISwitch!
    
    
    @IBOutlet weak var PapyrusLabel: UILabel!
    @IBOutlet weak var PapyrusSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //personalInformationLabel.configuration?.attributedTitle?.font = UIFont(name:"Avenir Next", size:18)
        
        fontDisplay.font = UIFont(name: fontSet, size: 18)
        AvenirNextLabel.font = UIFont(name: "Avenir Next", size: 18)
        AmericanTypewriterLabel.font = UIFont(name: "American Typewriter", size: 18)
        MenloRegularLabel.font = UIFont(name: "Menlo-Regular", size: 18)
        PapyrusLabel.font = UIFont(name: "Papyrus", size: 18)
        
        
        

        // Do any additional setup after loading the view.
    }
    

    

}
