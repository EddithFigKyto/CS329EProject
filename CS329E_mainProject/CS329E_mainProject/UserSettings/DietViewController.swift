//
//  DietViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/8/22.
//

import UIKit

class DietViewController: UIViewController {

    @IBOutlet weak var pageTitle: UILabel!
    
    /*
          vegetarian = "Vegetarian",
          vegan = "Vegan",
          gluten_free = "Gluten Free",
          sugar_free = "Sugar Free",
          lactose_free = "Lactose Free",
          nut_free = "Nut Free",
          none = "",
          halal = "Halal"
     */
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        pageTitle.font = UIFont(name: "Avenir Next", size: 22)
    }
    
    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    

    

}
