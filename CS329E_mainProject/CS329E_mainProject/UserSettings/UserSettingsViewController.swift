//
//  ViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/7/22.
//

import UIKit

//segue identifiers for VCs associated with each button on menu
let personalInformationSegueIdentifier:String = "personalInformationSegue"
let dietSegueIdentifier:String = "dietFiltersSegue"
let customizationSegueIdentifier: String  = "customizationSegue"

//Protocol definition that allows the name of the user to be updated
protocol changeNameProtocol{
    func changeName(newName:String)
}

// Protocol definition that allows the profile picture of the user to be updated
protocol changeProfilePicture {
    func changeProfilePic(newPicture: UIImage)
}

class UserSettingsViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, changeNameProtocol, changeProfilePicture{
    
    //variable to store the user's name
    public var name = "Kyto"
    
    //public let userSettings = CustomDefaults()
    
    //Outlets for labels and buttons on the VC

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalInformationLabel: UIButton!
    @IBOutlet weak var dietFiltersLabel: UIButton!
    @IBOutlet weak var customizationLabel: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userSettings.setUp()
        addNavBarImage()
        
        //Set greeting to user's name and change font to Avenir Next, size 22
        nameLabel.text = "Hello \(name)!"
        nameLabel.font = UIFont(name: fontSet!, size:22)
        
        //Change font of all buttons to Avenir Next, size 18
        personalInformationLabel.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        dietFiltersLabel.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        customizationLabel.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        privacyPolicyButton.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        logOutButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        
        profilePicture.image = picture
        profilePicture!.layer.frame = CGRectInset(profilePicture!.layer.frame, 0, 0)
        profilePicture!.layer.borderColor = UIColor.gray.cgColor
        profilePicture!.layer.cornerRadius = profilePicture!.frame.height/2
        profilePicture!.layer.masksToBounds = true
        profilePicture!.clipsToBounds = true
        profilePicture!.layer.borderWidth = 0.5
        profilePicture!.contentMode = UIView.ContentMode.scaleAspectFill
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Set greeting to user's name and change font to Avenir Next, size 22
        nameLabel.text = "Hello \(name)!"
        nameLabel.font = UIFont(name: fontSet!, size:22)
        
        //Change font of all buttons to fontSet, size 18
        personalInformationLabel.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        dietFiltersLabel.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        customizationLabel.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        privacyPolicyButton.configuration?.attributedTitle?.font = UIFont(name:fontSet!, size:18)
        logOutButton.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
    }
    
    //when segue to personal information VC is triggered, send over self as delegate and name as currentName
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == personalInformationSegueIdentifier,
           let nextVC = segue.destination as? PersonalInformationViewController {
            // delegate to change profile picture settings
            nextVC.delegate = self
            nextVC.currentName = name
            //nextVC.picture = profilePicture.image
        }
        
        if segue.identifier == dietSegueIdentifier,
           let nextVC = segue.destination as? DietViewController {
            // if user changes profile picture, the change will be reflected on this VC
            nextVC.picture = profilePicture.image
        }
        
        if segue.identifier == customizationSegueIdentifier,
           let nextVC = segue.destination as? CustomizationViewController {
            // if user changes profile picture, the change will be reflected on this VC
            nextVC.picture = profilePicture.image
        }
           
    }
    
    //function defined in protocol that updates the user's name if the user changes it. 
    func changeName(newName: String) {
        name = newName
        self.viewDidLoad()
    }
    
    // function defined in protocol that updated the user's profile picture if the user changes it
    func changeProfilePic(newPicture: UIImage) {
        self.profilePicture.image = newPicture
        
        profilePicture!.layer.frame = CGRectInset(profilePicture!.layer.frame, 0, 0)
        profilePicture!.layer.borderColor = UIColor.gray.cgColor
        profilePicture!.layer.cornerRadius = profilePicture!.frame.height/2
        profilePicture!.layer.masksToBounds = true
        profilePicture!.clipsToBounds = true
        profilePicture!.layer.borderWidth = 0.5
        profilePicture!.contentMode = UIView.ContentMode.scaleAspectFill
    }
    
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
    
}
