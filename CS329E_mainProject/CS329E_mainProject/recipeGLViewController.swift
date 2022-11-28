//
//  recipeGLViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 11/28/22.
//

import UIKit

class recipeGLViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ingridients = ["Greek Salad", "Vegetarian Tacos","Pork Gyoza", "Chicken Fajitas"]

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ingridientLabel: UILabel!
    
    var itemName:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ingridientLabel.text = itemName
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "textCell", for: indexPath)
        cell.textLabel?.text = ingridients[row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.ingridients.count
    }

}
