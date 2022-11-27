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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        //fetchRecipes()

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
