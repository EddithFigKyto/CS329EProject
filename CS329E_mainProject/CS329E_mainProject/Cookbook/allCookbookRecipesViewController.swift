//
//  allCookbookRecipesViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//

let textCellIdentifier = "favoritesTextCell"
var recipe = ["1", "2"]


import UIKit

class allCookbookRecipesViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var favoritesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        favoritesTableView.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! RecipeTableViewCell
        cell.recipeTitle.text = recipes[row].title
        cell.recipeDescription.text = recipes[row].description[0]
        cell.recipeImage.image = UIImage(named: "greek_salad")
        //cell.textLabel?.text =
        //cell.detailTextLabel?.text = recipes[row].description[0]
        
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
