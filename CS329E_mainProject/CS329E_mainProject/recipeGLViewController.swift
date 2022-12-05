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
        
        addNavBarImage()
        
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "recipeSegue1" {
            let destination = segue.destination as? ScrollRecipeViewController
        }
    }
    
    // logo formatting function
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
}
