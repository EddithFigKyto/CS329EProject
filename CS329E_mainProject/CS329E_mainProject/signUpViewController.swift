//
//  signUpViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 10/30/22.
//

import UIKit
import FirebaseAuth

class signUpViewController: UIViewController {

    @IBOutlet weak var userTF2: UITextField!
 
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet var VC: UIView!
    @IBOutlet weak var emailTF2: UITextField!
    @IBOutlet weak var passwordTF2: UITextField!
    @IBOutlet weak var confirmTF2: UITextField!
    
    var delegate: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func create2pressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTF2.text!, password: passwordTF2.text!) { [self]
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
