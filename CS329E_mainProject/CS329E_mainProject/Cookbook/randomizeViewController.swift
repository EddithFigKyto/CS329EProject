//
//  randomizeViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//

import UIKit

class randomizeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
    }
    
    
    @IBAction func randomizeButtonPress(_ sender: Any) {
        var recipeNum = randomize()
        titleLabel.text = recipes[recipeNum].title
        
    }
    
    
    func randomize() -> Int {
        let randomInt = Int.random(in: 1..<recipes.count)
        return randomInt
    }
    

    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }

}
