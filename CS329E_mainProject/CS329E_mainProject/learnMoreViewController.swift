//
//  learnMoreViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 11/27/22.
//

import UIKit

class learnMoreViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage()
        
    }
    
     func addNavBarImage() {
         let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
         let titleImageView = UIImageView(image: UIImage(named: "banner1"))
         titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
         titleView.addSubview(titleImageView)
         navigationItem.titleView = titleView
     }
     
}
