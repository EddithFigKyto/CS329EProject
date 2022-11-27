//
//  HomeVC.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-09.
//

import UIKit

protocol DisplayRecipe{
    func sendAllInfo(someRecipe:Recipe)
}

class HomeVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.register(homeCell.nib(), forCellReuseIdentifier: "homeCell")
        addNavBarImage()
        tableView.dataSource = self
        tableView.delegate = self
   
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        
        let selectedRecipe = recipes[row]
        
        
        cell.titleLabel.text = selectedRecipe.title
        cell.descriptionLabel.text = selectedRecipe.description[0]
        cell.picture.image = UIImage(named: "greek_salad")
        let imageURL = URL(string: selectedRecipe.recipeImage)!
        
        let session = URLSession(configuration: .default)
        
        // Create a task for accessing the image
        let task = session.dataTask(with: imageURL) {
            (data, response, error) in
            
            guard error == nil else { return }
            
            if let httpResponse = response as? HTTPURLResponse {
                
                // ensure that we got a response code of 200 (which means "success")
                guard httpResponse.statusCode == 200 else { return }
                
                if data != nil {
                    DispatchQueue.main.async {
//                        cell.recipeImage.image = UIImage(data: receivedData)
                    }
                }
            }
        }
        task.resume()
        
        return cell
    }
    
//    adds chef's kiss logo at top
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
    
    var delegate: UIViewController!
    
//click on cell to segue to the recipeDisplayVC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        //let otherVC = delegate as! DisplayRecipe
        let selectedRecipe = recipes[row]
       // otherVC.sendAllInfo(someRecipe: selectedRecipe)

//        send data to next VC
    
        
    }
    
    
    
    


  

}
