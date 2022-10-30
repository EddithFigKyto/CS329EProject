//
//  cookbookCategoryViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//

import UIKit

class cookbookCategoryViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    func addNavBarImage() {
        let navController = navigationController!

        let image = UIImage(named: "banner1") //Your logo url here
        let imageView = UIImageView(image: image)

        let bannerWidth = navController.navigationBar.frame.size.width
        let bannerHeight = navController.navigationBar.frame.size.height

        let bannerX = bannerWidth / 2 - (image?.size.width)! / 2
        let bannerY = bannerHeight / 2 - (image?.size.height)! / 2

        imageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth, height: bannerHeight)
        imageView.contentMode = .scaleAspectFit

        navigationItem.titleView = imageView
        }
    
}
