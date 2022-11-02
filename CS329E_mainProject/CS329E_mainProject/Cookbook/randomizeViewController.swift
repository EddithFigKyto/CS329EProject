//
//  randomizeViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//

import UIKit

class randomizeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
    }
    

    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }

}
