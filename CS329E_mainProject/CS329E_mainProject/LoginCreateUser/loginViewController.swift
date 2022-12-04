//
//  loginViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 10/30/22.
//

import UIKit
import FirebaseAuth


class loginViewController: UIViewController {

    @IBOutlet weak var learn: UILabel!
    @IBOutlet weak var userTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var imageTop: UIImageView!
    @IBOutlet weak var segControl: UISegmentedControl!
    @IBOutlet weak var animationImage: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var cpLabel: UILabel!
    @IBOutlet weak var createAccount: UIButton!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var cpTextF: UITextField!
    
    var bool1 = true
    
    let queue = DispatchQueue(label: "myQueue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        passwordTF.isSecureTextEntry = true
        cpTextF.isSecureTextEntry = true
        cpTextF.isHidden = true
        cpTextF.isHidden = true
        cpLabel.isHidden = true
        createAccount.isHidden = true
        logInButton.isHidden = false
        animationImage.isHidden = true

        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleRight(recognizer:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        passwordTF.isSecureTextEntry = true

        
        addNavBarImage()
    }
    @IBAction func handleRight(recognizer: UISwipeGestureRecognizer) {
        performSegue(withIdentifier: "learnMoreSegue", sender: self)
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
                //create a welcome __name
                self.segControl.isHidden = true
                self.userTF.isHidden = true
                self.userLabel.isHidden = true
                self.passwordLabel.isHidden = true
                self.passwordTF.isHidden = true
                self.learn.isHidden = true
                self.logInButton.isHidden = true
                self.imageTop.isHidden = true
                self.animationImage.isHidden = false
                
                self.queue.async {
                    DispatchQueue.main.sync {
                        self.animationImage.alpha = 1.0
                        UIView.animate (
                            withDuration: 3.0,
                            animations: {
                                self.animationImage.alpha = 0.0
                            }
                        )
                    }
                    sleep(2)
                    DispatchQueue.main.sync {
                        self.performSegue(withIdentifier: "loginSegue", sender: nil)
                    }

                }
                
            }
        }
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: userTF.text!, password: passwordTF.text!) {
                    authResult, error in
                    if let error = error as NSError? {
                        self.statusLabel.text = "\(error.localizedDescription)"
                    }
                    else {
                        self.statusLabel.text = "Account created, ready to log in."
                    }
                }
    }
   
    func addNavBarImage() {
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
}
