//
//  PersonalInformationViewController.swift
//  UserSettingsDemo1
//
//  Created by Eddith Figueroa on 10/7/22.
//

import UIKit

class PersonalInformationViewController: UIViewController{
    
    @IBOutlet weak var pageTitle: UILabel!
    
    var delegate:UIViewController!
    var currentName:String = "" //HERE 
    var currentBirthday:String = "07/17/1999"
    var currentEmail:String = "princesspeach2002@aol.com"
    
    @IBOutlet weak var nameEditor: UIButton!
    
    @IBOutlet weak var birthdayEditor: UIButton!
    
    @IBOutlet weak var emailEditor: UIButton!
    
    @IBOutlet weak var profilePictureEditor: UIButton!
    
    @IBOutlet weak var editMessageLabel: UILabel!
    

   
    @IBOutlet weak var fontSetLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        pageTitle.font = UIFont(name: fontSet, size: 22)
        
        editMessageLabel.font = UIFont(name: fontSet, size: 18)
        
        nameEditor.setTitle("Name : \(currentName)", for: .normal)
        nameEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet, size:18)
        
        birthdayEditor.setTitle("Birthday: \(currentBirthday)", for: .normal)
        birthdayEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet, size:18)
        
        emailEditor.setTitle("Email: \(currentEmail)", for: .normal)
        emailEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet, size:18)
        
        profilePictureEditor.setTitle("Edit Profile Picture", for: .normal)
        profilePictureEditor.configuration?.attributedTitle?.font = UIFont(name: fontSet, size:18)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pageTitle.font = UIFont(name: fontSet, size: 22)
        
        editMessageLabel.font = UIFont(name: fontSet, size: 18)
        
        nameEditor.setTitle("Name : \(currentName)", for: .normal)
        nameEditor.configuration?.attributedTitle?.font = UIFont(name:fontSet, size:18)
        
        birthdayEditor.setTitle("Birthday: \(currentBirthday)", for: .normal)
        birthdayEditor.configuration?.attributedTitle?.font = UIFont(name:fontSet, size:18)
        
        emailEditor.setTitle("Email: \(currentEmail)", for: .normal)
        emailEditor.configuration?.attributedTitle?.font = UIFont(name:fontSet, size:18)
        
        profilePictureEditor.setTitle("Edit Profile Picture", for: .normal)
        profilePictureEditor.configuration?.attributedTitle?.font = UIFont(name:fontSet, size:18)
        
        
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
