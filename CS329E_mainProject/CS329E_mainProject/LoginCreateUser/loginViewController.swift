//
//  loginViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 10/30/22.
//

import UIKit
import FirebaseAuth
import CoreMotion


// this variable hold an optional UIImage to set profilePicture if changed
public var picture: UIImage? = UIImage(named: "profileFiller2")

public var chosenColor:UIColor? = UIColor.systemCyan

class loginViewController: UIViewController, UITextFieldDelegate{
    
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
    
    let userDefaultInitializer = CustomDefaults()

    
    let queue = DispatchQueue(label: "myQueue")
    
    let manager = CMMotionManager()
    
    override func viewDidLoad() {
        
        userDefaultInitializer.setUp()
        
        super.viewDidLoad()
        //hide create account stuff
        passwordTF.isSecureTextEntry = true
        cpTextF.isSecureTextEntry = true
        cpTextF.isHidden = true
        cpTextF.isHidden = true
        cpLabel.isHidden = true
        createAccount.isHidden = true
        logInButton.isHidden = false
        animationImage.isHidden = true
        passwordTF.isSecureTextEntry = true
        
        userTF.delegate = self
        passwordTF.delegate = self
        cpTextF.delegate = self
        
        //shake alert
        var xInPositiveDirection = 0.0
        var xInNegativeDirection = 0.0
        var shakeCount = 0
        var tempVariable = 0
        
        manager.deviceMotionUpdateInterval = 0.02
        
        manager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: {
            (data, error) in
            if data!.userAcceleration.x > 1.0 || data!.userAcceleration.x < -1.0 {
                if data!.userAcceleration.x > 1.0 {
                    xInPositiveDirection = data!.userAcceleration.x
                }
                if data!.userAcceleration.x < -1.0 {
                    xInNegativeDirection = data!.userAcceleration.x
                }
                if xInPositiveDirection != 0.0 && xInNegativeDirection != 0.0 {
                    shakeCount = shakeCount + 1
                    xInPositiveDirection = 0.0
                    xInNegativeDirection = 0.0
                }
                
                if shakeCount > 5 {
                    tempVariable = tempVariable + 1
                    let controller = UIAlertController(title: "Did something go wrong?", message: "Report a probem", preferredStyle: .alert)
                    controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    controller.addTextField(configurationHandler: {
                        (textField:UITextField!) in
                        textField.placeholder = "Enter something"
                    })
                    controller.addAction(UIAlertAction(title: "Report", style: .default))
                    self.present(controller, animated: true)
                    shakeCount = 0
                }
            }})
    
        //swipe right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleRight(recognizer:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
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
                    self.statusLabel.text = "Account created!"
                    userCustomizations.set(self.userTF.text, forKey: "email")
                    userCustomizations.set(true, forKey: "changed")
                    self.performSegue(withIdentifier: "createUserNextSegue", sender: nil)
                }
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
