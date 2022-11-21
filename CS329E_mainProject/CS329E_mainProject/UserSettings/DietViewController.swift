//
//  DietViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/8/22.
//

import UIKit

class DietViewController: UIViewController {

    @IBOutlet weak var pageTitle: UILabel!
    
    /*
          vegetarian = "Vegetarian",
          vegan = "Vegan",
          gluten_free = "Gluten Free",
          sugar_free = "Sugar Free",
          lactose_free = "Lactose Free",
          nut_free = "Nut Free",
          none = "",
          halal = "Halal"
     */
    
    
    @IBOutlet weak var dietTitleLabel: UILabel!
    @IBOutlet weak var preferencesLabel: UILabel!
    
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    
    @IBOutlet weak var veganLabel: UILabel!
    @IBOutlet weak var veganSwitch: UISwitch!
    
    @IBOutlet weak var glutenFreeLabel: UILabel!
    @IBOutlet weak var glutenFreeSwitch: UISwitch!
   
    @IBOutlet weak var nutFreeSwitch: UISwitch!
    @IBOutlet weak var nutFreeLabel: UILabel!
    
    @IBOutlet weak var halalLabel: UILabel!
    @IBOutlet weak var halalSwitch: UISwitch!
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    var dirtyBit:Int = 0
    
    
    // this variable hold an optional UIImage to set profilePicture if changed
    var picture: UIImage?
    
    var delegate:UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        // profile picture is always set to user settings profile picture - reflects any changes made by user
        profilePicture.image = picture
        
        pageTitle.font = UIFont(name: fontSet, size: 22)
        
        dietTitleLabel.font = UIFont(name: fontSet, size: 18)
        preferencesLabel.font = UIFont(name: fontSet, size: 18)
        vegetarianLabel.font = UIFont(name: fontSet, size: 18)
        veganLabel.font = UIFont(name: fontSet, size: 18)
        glutenFreeLabel.font = UIFont(name: fontSet, size: 18)
        nutFreeLabel.font = UIFont(name: fontSet, size: 18)
        halalLabel.font = UIFont(name: fontSet, size: 18)
        
        
        //personalInformationLabel.configuration?.attributedTitle?.font = UIFont(name:fontSet, size:18)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        pageTitle.font = UIFont(name: fontSet, size: 22)
        dietTitleLabel.font = UIFont(name: fontSet, size: 18)
        preferencesLabel.font = UIFont(name: fontSet, size: 18)
        vegetarianLabel.font = UIFont(name: fontSet, size: 18)
        veganLabel.font = UIFont(name: fontSet, size: 18)
        glutenFreeLabel.font = UIFont(name: fontSet, size: 18)
        nutFreeLabel.font = UIFont(name: fontSet, size: 18)
        halalLabel.font = UIFont(name: fontSet, size: 18)
        
    }
    
    
    @IBAction func vegetarianPressed(_ sender: UISwitch) {
        //dirtyBit = 1
        if sender.isOn == true{
            
        }
        
    }
    
    @IBAction func veganPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            
        }
    }
    
    
    @IBAction func glutenFreePressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            
        }
    }
    
    
    @IBAction func nutFreePressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            
        }
    }
    
    
    @IBAction func halalPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            
        }
    }
    
    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
}
