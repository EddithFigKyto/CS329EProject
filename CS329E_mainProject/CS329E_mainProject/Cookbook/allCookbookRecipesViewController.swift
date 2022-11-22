//
//  allCookbookRecipesViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//

let textCellIdentifier = "favoritesTextCell"
var recipe = ["1", "2"]


import UIKit

class allCookbookRecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! RecipeTableViewCell
        cell.recipeTitle.text = recipes[row].title
        cell.recipeDescription.text = recipes[row].description[0]
        //cell.recipeImage.image = UIImage(named: "greek_salad")
        //cell.textLabel?.text =
        //cell.detailTextLabel?.text = recipes[row].description[0]
        
        let imageURL = URL(string: recipes[row].recipeImage)!
        
        let session = URLSession(configuration: .default)
        
        // Create a task for accessing the image
        let task = session.dataTask(with: imageURL) {
            (data, response, error) in
            
            guard error == nil else { return }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                // ensure that we got a response code of 200 (which means "success")
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
    
    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }

}
