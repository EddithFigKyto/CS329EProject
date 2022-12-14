//
//  allCookbookRecipesViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/19/22.
//


// cookbook favorites table view cell identifier
let textCellIdentifier = "favoritesTextCell"


import UIKit

// protocol for filtering recipes via the filterPopUpVC
protocol filterProtocol{
    func filter(tempDietFilters: [Recipe.diet], tempDishFilters: [Recipe.dishType])
}


// holds the visible recipes in cookbook
// will change if filters applied (see filter func)
var filteredRecipes = [Recipe]()

class allCookbookRecipesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, filterProtocol {

    // recipes visible via table view
    @IBOutlet weak var favoritesTableView: UITableView!
    
    // button leads to filters modal VC
    @IBOutlet weak var filtersButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // add logo
        addNavBarImage()
        
        
        // set table view data source and delegate to self
        favoritesTableView.dataSource = self
        favoritesTableView.delegate = self

    }
    
    // the userLikedRecipes data needs to reload everytime the allCookbookRecipesVC appears
    // this is to ensure that the list of recipes reflects new saves/unsaves
    override func viewWillAppear(_ animated: Bool) {
        filteredRecipes = userLikedRecipes
        favoritesTableView.reloadData()
    }
    
    // row formatting
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        
    // number of rows always equal to length of filteredRecipes array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredRecipes.count
    }
    
    // create cells
    // use of networking to aquire the recipe images
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = favoritesTableView.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath) as! RecipeTableViewCell
        
        // cell title to recipe title
        cell.recipeTitle.text = filteredRecipes[row].title
        
        // cell title font to user default font
        cell.recipeTitle.font = UIFont(name: fontSet!, size: 18)
        
        // cell description to recipe description
        cell.recipeDescription.text = filteredRecipes[row].description[0]
        
        // cell description fon to user default font
        cell.recipeDescription.font = UIFont(name: fontSet!, size: 18)
        
        // pull the recipe's unique image address URL property
        let imageURL = URL(string: filteredRecipes[row].recipeImage)!
        
        // start session to prep app to access the URL address
        let session = URLSession(configuration: .default)
        
        // create a task for accessing the image
        let task = session.dataTask(with: imageURL) {
            (data, response, error) in
            
            guard error == nil else { return }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                // ensure that we got a response code of 200 (which means "success")
                guard httpResponse.statusCode == 200 else { return }
                
                // retrieve the image
                if let receivedData = data {
                    DispatchQueue.main.async {
                        cell.recipeImage.image = UIImage(data: receivedData)
                    }
                }
            }
        }
        task.resume()
        
        // return the table view cell with recipe content
        return cell
    }
    
    // click on cell to segue to the ScrollRecipeVC
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            // identify selected cell
            favoritesTableView.deselectRow(at: indexPath, animated: true)
            
            // note cell index
            let row = indexPath.row

            // use index to pull the recipe and access recipe info
            let selectedRecipe = userLikedRecipes[row]
            
            // send recipe info to Scroll View VC
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "ScrollRecipeViewController") as! ScrollRecipeViewController
            
            vc.saveButton.title = "Unsave"
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
            
            // pull the recipe's unique image address URL property
            let imageURL = URL(string: selectedRecipe.recipeImage)!
            
            // start session to prep app to access the URL address
            let session = URLSession(configuration: .default)
            
            // create a task for accessing the image
            let task = session.dataTask(with: imageURL) {
                (data, response, error) in
                
                guard error == nil else { return }
                
                if let httpResponse = response as? HTTPURLResponse {
                    
                    // ensure that we got a response code of 200 (which means "success")
                    guard httpResponse.statusCode == 200 else { return }
                    
                    // retrieve the image
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
    
    // need to set filterPopUpVC delegate to self
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSegue",
           let nextVC = segue.destination as? filterPopUpViewController {
            nextVC.delegate = self
        }
    }
    
    // takes filters from filterPopUpVC and changes the recipes visible to user
    func filter(tempDietFilters: [Recipe.diet], tempDishFilters: [Recipe.dishType]) {
        filteredRecipes = []
        
        // filter the recipes using the filter switches selected by the user
        // filters are stored as enum values in the temporary filter arrays
        // each enum filter is checked against the recipe properties to either keep it or filter it out
        
        // if no filters are selected
        if tempDietFilters == [] && tempDishFilters == [] {
            filteredRecipes = userLikedRecipes
        }
        
        // if only dish filters are selected
        else if tempDietFilters == [] && tempDishFilters != [] {
            for filter in tempDishFilters {
                for recipe in userLikedRecipes {
                    if recipe.dish == filter {
                        filteredRecipes.append(recipe)
                    }
                }
            }
        }
        
        // if only diet filters are selected
        else if tempDishFilters == [] && tempDietFilters != [] {
            for filter in tempDietFilters {
                for recipe in userLikedRecipes {
                    if recipe.dietaryRestr == filter {
                        filteredRecipes.append(recipe)
                    }
                }
            }
        }
        
        // if both filter types are selected
        else {
            for filter in tempDishFilters {
                for otherfilter in tempDietFilters {
                    for recipe in userLikedRecipes {
                        if recipe.dish == filter && recipe.dietaryRestr == otherfilter {
                            filteredRecipes.append(recipe)
                        }
                    }
                }
            }
        }
        
        // must reload table view data to see changes
        favoritesTableView.reloadData()
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
