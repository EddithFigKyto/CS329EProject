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
    @IBOutlet var emailTF2: UIView!
    @IBOutlet weak var passwordTF2: UITextField!
    @IBOutlet weak var confirmTF2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func create2pressed(_ sender: Any) {
    }
    
    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    

}
