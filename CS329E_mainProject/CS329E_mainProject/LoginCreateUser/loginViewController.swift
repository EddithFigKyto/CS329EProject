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
    @IBOutlet weak var cpTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cpTF.isHidden = true
        cpLabel.isHidden = true
        createAccount.isHidden = true
        
        addNavBarImage()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segControl(_ sender: Any) {
        switch segControl.selectedSegmentIndex {
        case 0:
            cpTF.isHidden = true
            cpLabel.isHidden = true
            createAccount.isHidden = true
        case 1:
            cpTF.isHidden = false
            cpLabel.isHidden = false
            createAccount.isHidden = false
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createAccountSegue",
           var nextVC =  segue.destination as? signUpViewController {
            nextVC.delegate = self
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
