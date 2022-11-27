//
//  ScrollRecipeViewController.swift
//  CS329E_mainProject
//
//  Created by Najia Khan Sherwani on 2022-11-26.
//
import UIKit

class ScrollRecipeViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var saves1: Int = 0
    var creator1: String = ""
    var title1: String = ""
    var ingredients1: [String] = []
    // array of strings which includes the measurement
    //var ingredients1: String = ""
    // for filtering by ingredient only
    //var plainIngredients1: [String] = []
    var description1: String = "" //not [String] here
    var stepList1: [String] = []
    var servingSize1: String = ""
    var cuisine1: String = ""
    //var dietaryRestr1: diet
    //var dish1: dishType
    var time1: String = ""//in min
    //var image: UIImage
    //var recipeImage1: String
    var tags1: String = ""
    var timersList1: [Int] = []  //in seconds // length is same as stepList // 0 means no timer
    var timerOn = false

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var stepsTableView: UITableView!
    @IBOutlet weak var ingredientTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sCLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    
//    func makeTimers(theStepList: [String]){
//        print("hi")
//        // parses through the steps to find a potential timer
//        for _ in theStepList{
//            timers.append(0)
//        }
//        for step in theStepList{
//            let index2 = theStepList.firstIndex(of: step)!
//            let components = step.components(separatedBy: " ")
//            for word in components{
//                if word == "min" || word == "minute" || word == "minutes"{
//                    let index1 = components.firstIndex(of: word)!
//                    let numStr = components[index1]
//                    if numStr.contains("-"){
//                        let range = numStr.components(separatedBy: "-")
//                        let timerTime = Int(((Int(range[0])! + Int(range[1])!)/2)*60) //in seconds
//                        timers[index2] = timerTime
//                    }
//                }
//            }
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        makeTimers(theStepList: stepList1)
//        print(timers)
        scrollView.contentSize = stackView.bounds.size
        scrollView.delegate = self
        imageView.image = UIImage(named: "greek_salad")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        addNavBarImage()
        stepsTableView.delegate = self
        stepsTableView.dataSource = self
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        //self.navigationItem.rightBarButtonItem = barButton
        titleLabel.text = title1
        descripLabel.text = "\n" + description1
        descripLabel.numberOfLines = 0 // Unlimited number of lines
        tagsLabel.text = tags1
        tagsLabel.numberOfLines = 0
        
    }
    
    
    // MARK: TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == stepsTableView{
            return stepList1.count
        }else{
            return ingredients1.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let row = indexPath.row
        if tableView == stepsTableView{
            let step = stepList1[row]
            cell.textLabel?.text = step
            cell.textLabel?.numberOfLines = 0
            if timersList1[row] != 0 { //always seconds
                let mySwitch = UISwitch()
                //mySwitch.addTarget(self, action: #selector(didChangeSwitch()), for: .valueChanged)
                cell.accessoryView = mySwitch
            }
            return cell
        }else{
            let ingred = ingredients1[row]
            cell.textLabel?.text = ingred
            cell.textLabel?.numberOfLines = 0
            return cell
        }
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == ingredientTableView{
            tableView.deselectRow(at: indexPath, animated: true)
            if let cell = tableView.cellForRow(at: indexPath) {
                if cell.accessoryType == .none {
                    cell.accessoryType = .checkmark
                }else{
                    cell.accessoryType = .none
                }
                    
                }
        }else{
            tableView.deselectRow(at: indexPath, animated: true)

        }

    }
    
//    @objc func didChangeSwitch(_ sender: UISwitch){
//        if sender.isOn {
//            timerOn = true
//
//
//            let q = DispatchQueue.global(qos: .background)
//            q.async{ [self] in //background thread
//                if Int(timer.remainingTime) == 0{
//                    break
//                }else{
//                    sleep(1)
//                    remainTimeInt! -= 1
//                    timer.remainingTime = String(remainTimeInt!)
//                    DispatchQueue.main.sync{ //main thread
//                        remainTime.text = String(remainTimeInt!)
//                        }
//                    }
//                }
//            }
//
//
//    }
    // MARK: Segue

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "AddPizzaSegue", //comma implies sequencing
//           let nextVC = segue.destination as? CreationVC{ //pointer to 2nd VC
//            let backItem = UIBarButtonItem()
//            backItem.title = "Pizza Order"
//            navigationItem.backBarButtonItem = backItem //add + button
//            nextVC.delegate = self
//            nextVC.pizzaList2 = pizzaList //pass data btwn the two VCs
//
//
//        }
//    }
    
    // MARK: Nav Banner
    
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    

}
