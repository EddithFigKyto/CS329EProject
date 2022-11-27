//
//  ScrollRecipeViewController.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-26.
//

import UIKit

class ScrollRecipeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!git add .
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = stackView.bounds.size
        scrollView.delegate = self

        imageView.image = UIImage(named: "greek_salad")
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
