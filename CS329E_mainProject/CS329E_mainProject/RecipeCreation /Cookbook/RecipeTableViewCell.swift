//
//  RecipeTableViewCell.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 11/21/22.
//

import UIKit

// this table view cell is structurally identical to the HomeTableViewCell
// this cell is displayed on the allCookbookRecipesVC
class RecipeTableViewCell: UITableViewCell {
    
    // label for recipe describtion
    @IBOutlet weak var recipeDescription: UILabel!
    
    // label for recipe title
    @IBOutlet weak var recipeTitle: UILabel!
    
    // imageView for the recipe image
    @IBOutlet weak var recipeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
