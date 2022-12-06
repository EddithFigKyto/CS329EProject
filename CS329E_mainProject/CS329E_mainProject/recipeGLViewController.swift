//
//  recipeGLViewController.swift
//  CS329E_mainProject
//
//  Created by Carla Gonzalez on 11/28/22.
//


import UIKit

//text cell in table view creation
class glTextCell:UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeDescription: UILabel!
}

class recipeGLViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var ingridientLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
 
    var itemName:String = ""
    var filteredRecipes2:[Recipe] = []
       
 override func viewDidLoad() {
     super.viewDidLoad()
     addNavBarImage()
     tableView.dataSource = self
     tableView.delegate = self
     ingridientLabel.text = itemName
     ingridientLabel.font = UIFont(name: "Avenir Next", size: 30)
     
     //filter recipes: check if grocery item is in ingredients list
     for recipe in recipes {
                 for item in recipe.printIngredients {
                     if item.lowercased().contains(itemName) {
                         filteredRecipes2.append(recipe)
                     }
                 }
             }
 }
 
 override func viewWillAppear(_ animated: Bool) {
     setChosenColor()
     UIButton.appearance(whenContainedInInstancesOf: [UIView.self]).tintColor = chosenColor
     
     UILabel.appearance(whenContainedInInstancesOf: [UIView.self]).font = UIFont(name: fontSet!, size: 18)
 }
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     return 100
 }
     
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return filteredRecipes2.count
 }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let row = indexPath.row
     let cell = tableView.dequeueReusableCell(withIdentifier: "glCell1", for: indexPath) as! glTextCell
     
     let selectedRecipe = filteredRecipes2[row]
     
     cell.title.text = selectedRecipe.title
     cell.recipeDescription.text = selectedRecipe.description[0]
     cell.recipeDescription.numberOfLines = 0 //unlimited lines
     cell.recipeImage.image = UIImage(named: "greek_salad")
     cell.recipeImage.layer.cornerRadius = 10
     cell.recipeImage.clipsToBounds = true
     
     let imageURL = URL(string: selectedRecipe.recipeImage)!
     
     let session = URLSession(configuration: .default)
     
     // Create a task for accessing the image
     let task = session.dataTask(with: imageURL) {
         (data, response, error) in
         
         guard error == nil else { return }
         
         if let httpResponse = response as? HTTPURLResponse {
             
             // ensure that we got a response code of 200 (which means "success")
             guard httpResponse.statusCode == 200 else { return }
             
             if let receivedData = data {
                 DispatchQueue.main.async {
                     cell.recipeImage.image = UIImage(data: receivedData)
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
     let selectedRecipe = filteredRecipes2[row]
    // otherVC.sendAllInfo(someRecipe: selectedRecipe)

//        send data to next VC
     let vc = self.storyboard!.instantiateViewController(withIdentifier: "ScrollRecipeViewController") as! ScrollRecipeViewController
     
     // The following lines of code will change the Save button text to "Unsave" if the user has already saved the selected recipe
     // changing this text changes the logic of pressing the Save/Unsave button to unsaving the recipe
     var userLikedTitles = [String]()
     
     for x in userLikedRecipes {
         userLikedTitles.append(x.title)
     }
     
     if userLikedTitles.contains(selectedRecipe.title) {
         vc.saveButton.title = "Unsave"
     }
     
     // the following code formats the scroll view content based on the recipe properties
     vc.title1 = selectedRecipe.title
     vc.description1 = selectedRecipe.description[0]
     vc.ingredients1 = selectedRecipe.printIngredients
     vc.stepList1 = selectedRecipe.stepList
     vc.timersList1 = selectedRecipe.timersList
     vc.tags1 = selectedRecipe.tags.joined(separator: ", ")
     vc.saves1 = selectedRecipe.saves
     vc.creator1 = selectedRecipe.creator
     vc.servingSize1 = selectedRecipe.servingSize
     vc.cuisine1 = selectedRecipe.cuisine
     vc.time1 = selectedRecipe.time
     
     // pulls recipe image using its URL
     let imageURL = URL(string: selectedRecipe.recipeImage)!
     
     let session = URLSession(configuration: .default)
     
     let task = session.dataTask(with: imageURL) {
         (data, response, error) in
         
         guard error == nil else { return }
         
         if let httpResponse = response as? HTTPURLResponse {
             
             // ensure that we got a response code of 200 (which means "success")
             guard httpResponse.statusCode == 200 else { return }
             
             if let receivedData = data {
                 DispatchQueue.main.async {
                     vc.imageView.image = UIImage(data: receivedData)
                 }
             }
         }
     }
     task.resume()
     
     // the following segues to the next screen while pushing the appropriate cell data
     self.navigationController?.pushViewController(vc, animated: true)
     
 }
 
 // MARK: ALGORITHM STUFF
 var saveSortedRecipes : [Recipe] = [] //recipes in ascending order by saves
 var savesList : [Int] = [] //in same order as recipes
 var savesAscending : [Int] = [] //sorted in ascending order
 var savesUsed: [Int] = []
 func sortRecipes(){
     for recipe in recipes{
         savesList.append(recipe.saves)
     }
     savesAscending = Array(savesList.sorted().reversed())
     print(savesAscending)
     var numsUsed : [Int] = []
     for num in savesAscending{
         if numsUsed.contains(num){
         }else{
             numsUsed.append(num)
             for recipe in recipes{
                 if num == recipe.saves{
                     saveSortedRecipes.append(recipe)
                 }
             }
         }
     }
 }

}
