//
//  GreetingAnimationViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/25/22.
//

import UIKit

class GreetingAnimationViewController: UIViewController {

    @IBOutlet weak var initialGreetingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Starting alpha value
        self.initialGreetingImage.alpha = 0.0
        
        UIView.animate (
            withDuration: 3.0,
            animations: {
                self.initialGreetingImage.alpha = 1.0
        })
    }
}


