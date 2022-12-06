//
//  randomizeViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//

import UIKit

class randomizeViewController: UIViewController {

    @IBOutlet weak var randomizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add logo
        addNavBarImage()

        // set button and label fonts to user defaults
        randomizeButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)

    }
    
    // randomizeButtonPress will pull a random recipe from the database and display it to the user
    // recipe info is sent to ScrollRecipeVC, where it is displayed
    @IBAction func randomizeButtonPress(_ sender: Any) {
        
        // generate random integer for recipe index
        let recipeNum = randomize()
        
        // pull recipe from database
        let selectedRecipe = recipes[recipeNum]

        // assign ScrollRecipeVC as VC to segue to
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ScrollRecipeViewController") as! ScrollRecipeViewController
        
        // send randomized recipe info the ScrollViewVC to display
        vc.title1 = selectedRecipe.title
        vc.description1 = selectedRecipe.description[0]
        vc.ingredients1 = selectedRecipe.printIngredients
        vc.stepList1 = selectedRecipe.stepList
        vc.timersList1 = selectedRecipe.timersList
        vc.tags1 = selectedRecipe.tags.joined(separator: ", ")
        
        // set URL to the Recipe's image URL property
        let imageURL = URL(string: recipes[recipeNum].recipeImage)!
        
        // start session to prep app to access the URL address
        let session = URLSession(configuration: .default)
        
        // create a task for accessing the image
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
    
    // returns a random integer within length of the recipes database
    func randomize() -> Int {
        let randomInt = Int.random(in: 1..<recipes.count)
        return randomInt
    }
    
    // logo formatting function
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }

}
