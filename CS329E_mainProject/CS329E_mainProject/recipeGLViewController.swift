//
//  recipeGLViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 11/28/22.
//

import UIKit

class glTextCell:UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeDescription: UILabel!
}

class recipeGLViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ingridientLabel: UILabel!
    
    var itemName:String = ""
    var filteredRecipes2 = [Recipe]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        ingridientLabel.text = itemName
        ingridientLabel.font = UIFont(name: "Avenir Next", size: 30)
        tableView.delegate = self
        tableView.dataSource = self
        
        for recipe in recipes {
            for item in recipe.printIngredients {
                if item.lowercased().contains(itemName) {
                    filteredRecipes2.append(recipe)
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "glCell1", for: indexPath) as! glTextCell
        let selectedRecipe = filteredRecipes2[row]
        cell.title?.text = selectedRecipe.title
        cell.recipeDescription?.text = selectedRecipe.description[0]
        cell.recipeImage.image = UIImage(named: "greek_salad")
        cell.recipeImage.layer.cornerRadius = 10
        cell.recipeImage.clipsToBounds = true
        
        let imageURL = URL(string: selectedRecipe.recipeImage)!
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: imageURL) {
            (data, response, error) in
            guard error == nil else { return }
            
            if let httpResponse = response as? HTTPURLResponse {
                guard httpResponse.statusCode == 200 else { return }
                if let receivedData = data {
                    DispatchQueue.main.async {
                        cell.recipeImage.image = UIImage(data: receivedData)
                    }
                }
            }
            
        }
        task.resume()
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipes2.count
    }
    var delegate:UIViewController!
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        let selectedRecipe = filteredRecipes2[row]
        
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "ScrollRecipeViewController") as! ScrollRecipeViewController
        
        vc.title1 = selectedRecipe.title
        vc.description1 = selectedRecipe.description[0]
        vc.ingredients1 = selectedRecipe.printIngredients
        vc.stepList1 = selectedRecipe.stepList
        vc.timersList1 = selectedRecipe.timersList
        vc.tags1 = selectedRecipe.tags.joined(separator: ", ")
        vc.saves1 = selectedRecipe.saves
        vc.creator1 = selectedRecipe.creator
        vc.servingSize1 = selectedRecipe.servingSize
        vc.cuisine1 = selectedRecipe.cuisine
        vc.time1 = selectedRecipe.time
        
        let imageURL = URL(string: selectedRecipe.recipeImage)!
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: imageURL) {
            (data, response, error) in
            
            guard error == nil else { return }
            
            if let httpResponse = response as? HTTPURLResponse {
                guard httpResponse.statusCode == 200 else { return }
                
                if let receivedData = data {
                    DispatchQueue.main.async {
                        vc.imageView.image = UIImage(data: receivedData)
                    }
                }
            }
        }
        task.resume()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
}
}
    
    
    
    
