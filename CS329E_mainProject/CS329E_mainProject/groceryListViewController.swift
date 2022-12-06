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
    var items = [String]()
    
    //create variables for core motion
    let manager = CMMotionManager()
    
    var xInPositiveDirection = 0.0
    var xInNegativeDirection = 0.0
    var shakeCount = 0
    var tempVariable = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        shakePhone()
        addNavBarImage()

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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "glSegue",
           let destination = segue.destination as? recipeGLViewController,
           let itemIndex = tableView.indexPathForSelectedRow?.row {
            destination.itemName = items[itemIndex]
        }
    }
    func shakePhone() {
        manager.deviceMotionUpdateInterval = 0.02
        
        manager.startDeviceMotionUpdates(to: OperationQueue.main, withHandler: {
            (data, error) in
            if data!.userAcceleration.x > 1.0 || data!.userAcceleration.x < -1.0 {
                if data!.userAcceleration.x > 1.0 {
                    self.xInPositiveDirection = data!.userAcceleration.x
                }
                if data!.userAcceleration.x < -1.0 {
                    self.xInNegativeDirection = data!.userAcceleration.x
                }
                if self.xInPositiveDirection != 0.0 && self.xInNegativeDirection != 0.0 {
                    self.shakeCount = self.shakeCount + 1
                    self.xInPositiveDirection = 0.0
                    self.xInNegativeDirection = 0.0
                }
                
                if self.shakeCount > 5 {
                    self.tempVariable = self.tempVariable + 1
                    let controller = UIAlertController(title: "Did something go wrong?", message: "Report a probem", preferredStyle: .alert)
                    controller.addAction(UIAlertAction(title: "Cancel", style: .cancel))
                    controller.addTextField(configurationHandler: {
                        (textField:UITextField!) in
                        textField.placeholder = "Type here"
                    })
                    controller.addAction(UIAlertAction(title: "Report", style: .default))
                    self.present(controller, animated: true)
                    self.shakeCount = 0
                }
                
            }
        })
    }
}
