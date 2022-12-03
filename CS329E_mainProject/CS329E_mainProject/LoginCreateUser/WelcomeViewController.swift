//
//  WelcomeViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/16/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var enterYourNameLabel: UILabel!
    @IBOutlet weak var enterYourBirthdayLabel: UILabel!
    @IBOutlet weak var dateFormatLabel: UILabel!
    
    @IBOutlet weak var enterButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        
        
    }
    
}
