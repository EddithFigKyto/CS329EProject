//
//  CustomizationViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 10/21/22.
//

import UIKit

class CustomizationViewController: UIViewController {
    
    
    @IBOutlet weak var ColorSchemeLabel: UIButton!
    
    @IBOutlet weak var FontButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FontButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        ColorSchemeLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FontButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        ColorSchemeLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        
    }
    
}
