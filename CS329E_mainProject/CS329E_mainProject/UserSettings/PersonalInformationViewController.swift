//
//  PersonalInformationViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/7/22.
//

import UIKit

class PersonalInformationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var pageTitle: UILabel!
    
    var delegate:UIViewController!
    var currentName:String = "" //HERE 
    var currentBirthday:String = "07/17/1999"
    var currentEmail:String = "princesspeach2002@aol.com"
    
    
    //potentially not needed
    @IBOutlet weak var nameEditor: UIButton!
    @IBOutlet weak var birthdayEditor: UIButton!
    @IBOutlet weak var emailEditor: UIButton!
    @IBOutlet weak var profilePictureEditor: UIButton!
    @IBOutlet weak var editMessageLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    // this variable hold an optional UIImage to set profilePicture if changed
    var picture: UIImage?
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var birthdayLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var backUpLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        // profile picture is always set to user settings profile picture - reflects any changes made by user
        profilePicture.image = picture
        
        pageTitle.font = UIFont(name: fontSet!, size: 22)
        
        editMessageLabel.font = UIFont(name: fontSet!, size: 18)
        
        nameLabel.text = currentName
        nameEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
        //birthdayEditor.setTitle("Birthday: \(currentBirthday)", for: .normal)
        birthdayLabel.text = currentBirthday
        birthdayEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
        //emailEditor.setTitle("Email: \(currentEmail)", for: .normal)
        emailLabel.text = currentEmail
        emailEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
        //profilePictureEditor.setTitle("Edit Profile Picture", for: .normal)
        profilePictureEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pageTitle.font = UIFont(name: fontSet!, size: 22)
        
        editMessageLabel.font = UIFont(name: fontSet!, size: 18)
        
        nameLabel.text = currentName
        nameEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
        //birthdayEditor.setTitle("Birthday: \(currentBirthday)", for: .normal)
        birthdayLabel.text = currentBirthday
        birthdayEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
        //emailEditor.setTitle("Email: \(currentEmail)", for: .normal)
        emailLabel.text = currentEmail
        emailEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
        //profilePictureEditor.setTitle("Edit Profile Picture", for: .normal)
        profilePictureEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet!, size:18)
        
    }
    
    @IBAction func nameEditorPressed(_ sender: Any) {
        let controller = UIAlertController(
            title: "Edit Name:",
            message: "Enter Your Name",
            preferredStyle: .alert)
        controller.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel))
        controller.addTextField(configurationHandler: {
            (textField:UITextField!) in
            textField.placeholder = "Enter Name"
        })
        controller.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: {
                (paramAction:UIAlertAction!) in
                if let textFieldArray = controller.textFields {
                    let textFields = textFieldArray as [UITextField]
                    let enteredText = textFields[0].text
                    self.currentName = enteredText!
                    self.viewDidLoad()
                    
                    let otherVC = self.delegate as! changeNameProtocol
                    otherVC.changeName(newName: self.currentName)
                    self.dismiss(animated: true)
                    
                }
            }))
        present(controller, animated: true)
    }
    
    
    @IBAction func birthdayButtonPressed(_ sender: Any) {
        
        let controller = UIAlertController(
            title: "Edit Birthday:",
            message: "Enter Your Birthday : MM/DD/YYYY",
            preferredStyle: .alert)
        controller.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel))
        controller.addTextField(configurationHandler: {
            (textField:UITextField!) in
            textField.placeholder = "Enter Birthday"
        })
        controller.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: {
                (paramAction:UIAlertAction!) in
                if let textFieldArray = controller.textFields {
                    let textFields = textFieldArray as [UITextField]
                    let enteredText = textFields[0].text
                    self.currentBirthday = enteredText!
                    self.viewDidLoad()
                    
                }
            }))
        present(controller, animated: true)
    }
    
    
    // button which allows the user to chnage thier profile picture from their local gallery
    @IBAction func profilePictureChange(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    
    // triggers the profile picture image view change to the selected photo from the gallery
    // selection menu will disappear
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profilePicture.image = image
        
            profilePicture!.layer.frame = CGRectInset(profilePicture!.layer.frame, 0, 0)
            profilePicture!.layer.borderColor = UIColor.gray.cgColor
            profilePicture!.layer.cornerRadius = profilePicture!.frame.height/2
            profilePicture!.layer.masksToBounds = true
            profilePicture!.clipsToBounds = true
            profilePicture!.layer.borderWidth = 0.5
            profilePicture!.contentMode = UIView.ContentMode.scaleAspectFill
            
            let otherVC = delegate as! changeProfilePicture
            otherVC.changeProfilePic(newPicture: profilePicture.image!)
            

            picker.dismiss(animated: true)
        }
        
    }
    
    // if the user selects "cancel" when choosing their profile picture, the image picker view will disappear
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    // changes navigation bar image to the app logo and formats it to be centered on the top of the screen
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
    
    
    
    
    
//    @IBAction func button2Pressed(_ sender: Any) {
//        let otherVC = delegate as! TextChanger
//        otherVC.changeText(newName: textField2.text!)
//        self.dismiss(animated: true)
//    }

}
