//
//  CookbookViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/16/22.
//

import UIKit

class CookbookViewController: UIViewController {

    // Cookbook VC Label
    @IBOutlet weak var cookbookLabel: UILabel!
    
    // favoritesButton takes the user to a table view of the recipes they've saved
    @IBOutlet weak var favoritesButton: UIButton!
        
    // randombutton takes the user to the recipe randomizer, which pulls a random recipe from the database
    @IBOutlet weak var randombutton: UIButton!
    
    // restaurantsButton takes the user to restaurantsVC where they can find restaurants near them
    @IBOutlet weak var restaurantsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add logo
        addNavBarImage()
        
        // set button and label fonts to user defaults
        cookbookLabel.font = UIFont(name: fontSet!, size: 18)
        favoritesButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        randombutton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        restaurantsButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)

    }
    
    // logo formatting function
    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }

}
