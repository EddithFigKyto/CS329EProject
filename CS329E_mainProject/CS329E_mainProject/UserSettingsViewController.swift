//
//  ViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/7/22.
//

import UIKit

let personalInformationSegueIdentifier:String = "personalInformationSegue"
let dietSegueIdentifier:String = "dietSegue"

protocol changeNameProtocol{
    func changeName(newName:String)
}

class UserSettingsViewController: UIViewController, changeNameProtocol{
    
    public var name = "Kyto"
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalInformationLabel: UIButton!
    @IBOutlet weak var dietFiltersLabel: UIButton!
    @IBOutlet weak var notificationsLabel: UIButton!
    @IBOutlet weak var manageFriendsLabel: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Hello \(name)!"
        nameLabel.font = UIFont(name:"Avenir Next", size:22)
        
        personalInformationLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        dietFiltersLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        notificationsLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        manageFriendsLabel.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        privacyPolicyButton.titleLabel?.font = UIFont(name:"Avenir Next", size:18)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == personalInformationSegueIdentifier,
           let nextVC = segue.destination as? PersonalInformationViewController {
            nextVC.delegate = self
            nextVC.currentName = name
        }
    }
    
    func changeName(newName: String) {
        name = newName
        self.viewDidLoad()
    }

    
    
}
