//
//  CookbookViewController.swift
//  CS329E_mainProject
//
//  Created by Laynee Tourne-Morton on 10/16/22.
//

import UIKit

let cookbookMenu = ["Favorites", "Your Categories", "Recipes by Ingredient", "Randomize"]
let textCellIdentifier = "TextCell"

class CookbookViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var cookbookTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cookbookTV.delegate = self
        cookbookTV.dataSource = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookbookMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = cookbookTV.dequeueReusableCell(withIdentifier: textCellIdentifier, for: indexPath)
        cell.textLabel?.text = cookbookMenu[row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        cookbookTV.deselectRow(at: indexPath, animated: true)
    }

}
