//
//  randomizeViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//

import UIKit

class randomizeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var randomizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addNavBarImage()
        
        titleLabel.font = UIFont(name: fontSet!, size: 18)
        
        randomizeButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)

    }
    
    
    @IBAction func randomizeButtonPress(_ sender: Any) {
        var recipeNum = randomize()
        let selectedRecipe = recipes[recipeNum]
       // otherVC.sendAllInfo(someRecipe: selectedRecipe)

//        send data to next VC
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ScrollRecipeViewController") as! ScrollRecipeViewController
        
        vc.title1 = selectedRecipe.title
        vc.description1 = selectedRecipe.description[0]
        vc.ingredients1 = selectedRecipe.printIngredients
        vc.stepList1 = selectedRecipe.stepList
        vc.timersList1 = selectedRecipe.timersList
        vc.tags1 = selectedRecipe.tags.joined(separator: ", ")
        
        let imageURL = URL(string: recipes[recipeNum].recipeImage)!
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: imageURL) {
            (data, response, error) in
            
            guard error == nil else { return }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                // ensure that we got a response code of 200 (which means "success")
                guard httpResponse.statusCode == 200 else { return }
                
                if let receivedData = data {
                    DispatchQueue.main.async {
                        vc.imageView.image = UIImage(data: receivedData)
                    }
                }
            }
        }
        task.resume()
        
        // the following segues to the next screen while pushing the appropriate cell data
        self.navigationController?.pushViewController(vc, animated: true)
        
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
