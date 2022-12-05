//
//  PickProfilePictureViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/25/22.
//

import UIKit

class PickProfilePictureViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var uploadButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picture = UIImage(named: "profileFiller2")
        profilePictureImageView.image = picture
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func uploadPhotoButtonPressed(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
    }
    
    
    
    // triggers the profile picture image view change to the selected photo from the gallery
    // selection menu will disappear
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            
            picture = image
            profilePictureImageView!.image = image
        
            profilePictureImageView!.layer.frame = CGRectInset(profilePictureImageView!.layer.frame, 0, 0)
            profilePictureImageView!.layer.borderColor = UIColor.gray.cgColor
            profilePictureImageView!.layer.cornerRadius = profilePictureImageView!.frame.height/2
            profilePictureImageView!.layer.masksToBounds = true
            profilePictureImageView!.clipsToBounds = true
            profilePictureImageView!.layer.borderWidth = 0.5
            profilePictureImageView!.contentMode = UIView.ContentMode.scaleAspectFill
            

            picker.dismiss(animated: true)
        }
        
    }
    
    // if the user selects "cancel" when choosing their profile picture, the image picker view will disappear
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
}
