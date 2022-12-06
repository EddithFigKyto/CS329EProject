//
//  groceryListViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 11/27/22.
//

import UIKit
import CoreMotion

class groceryListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    @IBOutlet weak var tableView: UITableView!
    
    //create arrays of grocery items
    var items = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
       
        addNavBarImage()
    }
    
    //present alert to add grocery items
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
                    self.items.append(enteredText!)
                    self.tableView.reloadData()
                }
            }))
        present(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        cell.textLabel?.text = items[row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.items.count
    }
    func addNavBarImage() {
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    //disselect item 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    //segue to view controller with recipes that have item
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "glSegue",
           let destination = segue.destination as? recipeGLViewController,
           let itemIndex = tableView.indexPathForSelectedRow?.row {
            destination.itemName = items[itemIndex]
        }
    }
}

