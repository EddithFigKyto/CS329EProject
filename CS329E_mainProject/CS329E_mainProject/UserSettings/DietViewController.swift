//
//  DietViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/8/22.
//

import UIKit

public var dietPreferences: [String] = []

let diet = ["vegetarian", "vegan", "gluten-free", "nut-free", "halal"]

class DietViewController: UIViewController {

    @IBOutlet weak var pageTitle: UILabel!
    
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
        
        vegetarianSwitch.setOn(dietPreferences.contains("vegetarian"), animated: true)
        veganSwitch.setOn(dietPreferences.contains("vegan"), animated: true)
        glutenFreeSwitch.setOn(dietPreferences.contains("gluten-free"), animated: true)
        nutFreeSwitch.setOn(dietPreferences.contains("nut-free"), animated: true)
        halalSwitch.setOn(dietPreferences.contains("halal"), animated: true)
    }
    
    @IBAction func vegetarianPressed(_ sender: UISwitch) {
        //dirtyBit = 1
        if sender.isOn == true{
            if !dietPreferences.contains("vegetarian")
            {
                dietPreferences.append("vegetarian")
            }
        }
        else{
            dietPreferences.remove(at: dietPreferences.firstIndex(of: "vegetarian")!)
        }
        //print(dietPreferences)
    }
    
    @IBAction func veganPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !dietPreferences.contains("vegan")
            {
                dietPreferences.append("vegan")
            }
        }
        else{
            dietPreferences.remove(at: dietPreferences.firstIndex(of: "vegan")!)
        }
        //print(dietPreferences)
    }
    
    @IBAction func glutenFreePressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !dietPreferences.contains("gluten-free")
            {
                dietPreferences.append("gluten-free")
            }
        }
        else{
            dietPreferences.remove(at: dietPreferences.firstIndex(of: "gluten-free")!)
        }
        //print(dietPreferences)
    }
    
    @IBAction func nutFreePressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !dietPreferences.contains("nut-free")
            {
                dietPreferences.append("nut-free")
            }
        }
        else{
            dietPreferences.remove(at: dietPreferences.firstIndex(of: "nut-free")!)
        }
        //print(dietPreferences)
    }
    
    @IBAction func halalPressed(_ sender: UISwitch) {
        
        if sender.isOn == true{
            if !dietPreferences.contains("halal")
            {
                dietPreferences.append("halal")
            }
        }
        else{
            dietPreferences.remove(at: dietPreferences.firstIndex(of: "halal")!)
        }
        //print(dietPreferences)
    }
    
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
}
