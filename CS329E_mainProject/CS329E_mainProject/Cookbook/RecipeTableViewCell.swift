//
//  RecipeTableViewCell.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 11/21/22.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var recipeDescription: UILabel!
    @IBOutlet weak var recipeTitle: UILabel!
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
