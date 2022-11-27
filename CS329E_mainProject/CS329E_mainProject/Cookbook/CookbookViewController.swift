//
//  CookbookViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/16/22.
//

import UIKit
import Firebase
import FirebaseFirestore

class CookbookViewController: UIViewController {

    @IBOutlet weak var cookbookLabel: UILabel!
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    @IBOutlet weak var byIngredientButton: UIButton!
    
    @IBOutlet weak var randombutton: UIButton!
    
    @IBOutlet weak var restaurantsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        //fetchRecipes()
        
        // set button and label fonts to user defaults
        cookbookLabel.font = UIFont(name: fontSet!, size: 18)
        favoritesButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        byIngredientButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        randombutton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        restaurantsButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)

    }
    
    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
    
    func fetchRecipes() {
        
        var db = Firestore.firestore()
        
        db.collection("Recipes").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print(document.data())
                }
            }
        }
    }

}
