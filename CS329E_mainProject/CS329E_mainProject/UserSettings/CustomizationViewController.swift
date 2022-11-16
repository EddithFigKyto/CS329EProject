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
        
        addNavBarImage()
        
        FontButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        ColorSchemeLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        FontButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        ColorSchemeLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet, size: 18)
        
    }
    
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
}
