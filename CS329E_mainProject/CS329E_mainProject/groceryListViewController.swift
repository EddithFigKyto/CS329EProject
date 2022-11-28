//
//  groceryListViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 11/27/22.
//

import UIKit

class groceryListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItem(_ sender: Any) {
        let controller = UIAlertController(
            title: "Grocery list",
            message: "Add item",
            preferredStyle: .alert)
        controller.addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel))
        controller.addTextField(configurationHandler: {
            (textField:UITextField!) in
            textField.placeholder = "Enter something"
        })
        controller.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: {
                (paramAction:UIAlertAction!) in
                if let textFieldArray = controller.textFields {
                    let textFields = textFieldArray as [UITextField]
                    let enteredText = textFields[0].text
                    print(enteredText!)
                }
            }))
        present(controller, animated: true)
        
        
    }
    
    
}
