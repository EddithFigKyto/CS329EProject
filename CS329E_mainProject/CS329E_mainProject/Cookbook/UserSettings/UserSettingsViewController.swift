//
//  ViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/7/22.
//

import UIKit

//segue identifiers for VCs associated with each button on menu
let personalInformationSegueIdentifier:String = "personalInformationSegue"
let dietSegueIdentifier:String = "dietSegue"

//Protocol definition that allows the name of the user to be updated
protocol changeNameProtocol{
    func changeName(newName:String)
}

class UserSettingsViewController: UIViewController, changeNameProtocol{
    
    //variable to store the user's name
    public var name = "Kyto"
    
    //Outlets for labels and buttons on the VC
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalInformationLabel: UIButton!
    @IBOutlet weak var dietFiltersLabel: UIButton!
    @IBOutlet weak var notificationsLabel: UIButton!
    @IBOutlet weak var manageFriendsLabel: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set greeting to user's name and change font to Avenir Next, size 22
        nameLabel.text = "Hello \(name)!"
        nameLabel.font = UIFont(name:"Avenir Next", size:22)
        
        //Change font of all buttons to Avenir Next, size 18
        personalInformationLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        dietFiltersLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        notificationsLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        manageFriendsLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        privacyPolicyButton.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        
    }
    
    //when segue to personal information VC is triggered, send over self as delegate and name as currentName
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == personalInformationSegueIdentifier,
           let nextVC = segue.destination as? PersonalInformationViewController {
            nextVC.delegate = self
            nextVC.currentName = name
        }
    }
    
    //function defined in protocol that updates the user's name if the user changes it. 
    func changeName(newName: String) {
        name = newName
        self.viewDidLoad()
    }

    
    
}
