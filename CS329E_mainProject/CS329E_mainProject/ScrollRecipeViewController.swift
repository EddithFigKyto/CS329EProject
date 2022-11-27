//
//  ScrollRecipeViewController.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-26.
//

import UIKit

class ScrollRecipeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = stackView.bounds.size
        scrollView.delegate = self

        
    }
    

}
