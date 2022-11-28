//
//  loginViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 10/30/22.
//

import UIKit
import FirebaseAuth

class loginViewController: UIViewController {

    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var cpLabel: UILabel!
    @IBOutlet weak var createAccount: UIButton!

    @IBOutlet weak var cpTextF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cpTextF.isHidden = true
        cpLabel.isHidden = true
        createAccount.isHidden = true
        logInButton.isHidden = false
        
        addNavBarImage()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segControl(_ sender: Any) {
        switch segControl.selectedSegmentIndex {
        case 0:
            cpTextF.isHidden = true
            cpLabel.isHidden = true
            logInButton.isHidden = false
            createAccount.isHidden = true
        case 1:
            cpTextF.isHidden = false
            cpLabel.isHidden = false
            createAccount.isHidden = false
            logInButton.isHidden = true
        default:
            break
        }
    }
    @IBAction func logInPressed(_ sender: Any) {
        Auth.auth().signIn(withEmail: userTF.text!, password: passwordTF.text!) {
            authResult, error in
            if let error = error as NSError? {
                self.statusLabel.text = "\(error.localizedDescription)"
            }
            else {
                self.statusLabel.text = ""
                self.performSegue(withIdentifier: "loggedSegue", sender: nil)
            }
        }

    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: userTF.text!, password: passwordTF.text!) { [self]
                    authResult, error in
                    if let error = error as NSError? {
                        self.statusLabel.text = "\(error.localizedDescription)"
                    }
                    else {
                        self.statusLabel.text = ""
                    }
                }
        
    }
   
  
    
    func addNavBarImage() {
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
}
