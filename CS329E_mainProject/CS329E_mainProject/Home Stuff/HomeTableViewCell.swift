//
//  HomeTableViewCell.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-26.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    //    static let identifier = "homeCell"
    //
    //    static func nib() -> UINib {
    //        return UINib(nibName: "homeCell", bundle: nil)
    //    }
    //    public func configure(with title: String, description: String, imageName: String) {
    //        image.image = UIImage(systemName: imageName)
    //        descriptionLabel.text = description
    //        titleLabel.text = title
    //    }
  
  
    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18.0)
        descriptionLabel.numberOfLines = 0 //unlimited lines
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
