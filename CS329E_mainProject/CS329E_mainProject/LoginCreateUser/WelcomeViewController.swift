//
//  WelcomeViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/16/22.
//

import UIKit

class WelcomeViewController: UIViewController, UITextFieldDelegate {
    
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
        
        nameTextField.delegate = self
        birthdayTextField.delegate = self
    }
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MM/dd/yyyy"
        let date = birthdayTextField.text!

        if dateFormatterGet.date(from: date) != nil {
            userCustomizations.set(nameTextField.text!, forKey: "user name")
            userCustomizations.set(birthdayTextField.text!, forKey: "birthday")
            self.performSegue(withIdentifier: "profilePictureSegue", sender: self)
        } else {
            birthdayFormatCheckerLabel.text! = "Birthday Entered Invalid"
        }
    }
    
    // Called when 'return' key pressed
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
    // Called when the user clicks on the view outside of the UITextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
