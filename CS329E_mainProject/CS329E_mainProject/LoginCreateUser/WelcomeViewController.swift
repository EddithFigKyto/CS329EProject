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
    
    @IBOutlet weak var birthdayFormatCheckerLabel: UILabel!
    @IBOutlet weak var enterButtonOutlet: UIButton!
    
    let initialDefaults = CustomDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterYourNameLabel.font = UIFont(name: "Avenir Next", size: 18)
        enterYourBirthdayLabel.font = UIFont(name: "Avenir Next", size: 18)
        dateFormatLabel.font = UIFont(name: "Avenir Next", size: 18)
        
    
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM/dd/yyyy"
        let date = birthdayTextField.text!

        if dateFormatterGet.date(from: date) != nil {
            userCustomizations.set(nameTextField.text!, forKey: "name")
            userCustomizations.set(birthdayTextField.text!, forKey: "birthday")
            self.performSegue(withIdentifier: "profilePictureSegue", sender: self)
        } else {
            birthdayFormatCheckerLabel.text! = "Birthday Entered Invalid"
        }
        
    }
    
}
