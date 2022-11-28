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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            let time = timersList1[row]
            if time != 0 { //always seconds
                let mySwitch = UISwitch()
                mySwitch.tag = row
                mySwitch.addTarget(self, action: #selector(self.didChangeSwitch(_:)), for: .valueChanged)
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
    
    
    
    @objc func didChangeSwitch(_ sender: UISwitch){
        var countdown = timersList1[sender.tag] - 1 // for notification time
        let q = DispatchQueue.global(qos: .background)
        timerOn = sender.isOn
        q.async{ [self] in
            while timerOn {
                if countdown == 0{
                    DispatchQueue.main.sync{ //main thread
                        //send notifcation
                        print("notify")
                        let content = UNMutableNotificationContent()
                        content.title = title1
                        content.subtitle = "Time's Up!"
                        content.body = "It's time to proceed to the next step!"
                        content.sound = UNNotificationSound.defaultCritical
                        
                        // create trigger
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                        
                        // combine it all into a request
                        let request = UNNotificationRequest(identifier: "myNotification", content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request)
                        sender.setOn(false, animated: true) //turned button off should auto break the while loop
                        print("sent")
                    }
                    timerOn = false
                }else{
                    sleep(1)
                    print(countdown)
                    countdown -= 1
                }
            }
        }
    }

    
    // MARK: Nav Banner
    
    func addNavBarImage() {
        
        let titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        let titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    

}
