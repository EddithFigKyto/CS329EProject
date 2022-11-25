//
//  CustomizationViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 10/21/22.
//

import UIKit

class CustomizationViewController: UIViewController {
    
    
    @IBOutlet weak var profilePicture: UIImageView!
    
    // this variable hold an optional UIImage to set profilePicture if changed
    var picture: UIImage?
    
    @IBOutlet weak var CustomizationTitleLabel: UILabel!
    
    
    @IBOutlet weak var ColorSchemeLabel: UIButton!
    
    @IBOutlet weak var FontButtonLabel: UIButton!
    
    @IBOutlet weak var NotificationSettingsButtonLabel: UIButton!
    
    var delegate:UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        // profile picture is always set to user settings profile picture - reflects any changes made by user
        profilePicture.image = picture
        
        profilePicture!.layer.frame = CGRectInset(profilePicture!.layer.frame, 0, 0)
        profilePicture!.layer.borderColor = UIColor.gray.cgColor
        profilePicture!.layer.cornerRadius = profilePicture!.frame.height/2
        profilePicture!.layer.masksToBounds = true
        profilePicture!.clipsToBounds = true
        profilePicture!.layer.borderWidth = 0.5
        profilePicture!.contentMode = UIView.ContentMode.scaleAspectFill
        
        CustomizationTitleLabel.font = UIFont(name: fontSet!, size: 18)
        
        FontButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        ColorSchemeLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        NotificationSettingsButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        CustomizationTitleLabel.font = UIFont(name: fontSet!, size: 18)
        FontButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        ColorSchemeLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        NotificationSettingsButtonLabel.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size: 18)
        
    }
    
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
}
