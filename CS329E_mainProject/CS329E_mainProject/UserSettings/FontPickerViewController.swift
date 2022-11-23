//
//  FontPickerViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 10/30/22.
//

import UIKit

let font = ["Avenir Next", "American Typewriter", "Menlo-Regular", "Papyrus"]

public var fontSet = font[0]

class FontPickerViewController: UIViewController {
    
    @IBOutlet weak var fontDisplay: UILabel!
    
    @IBOutlet weak var AvenirNextLabel: UILabel!
    @IBOutlet weak var AvenirNextSwitch: UISwitch!
    
    @IBOutlet weak var AmericanTypewriterLabel: UILabel!
    @IBOutlet weak var AmericanTypewriterSwitch: UISwitch!
    
    @IBOutlet weak var MenloRegularLabel: UILabel!
    @IBOutlet weak var MenloRegularSwitch: UISwitch!
    
    @IBOutlet weak var PapyrusLabel: UILabel!
    @IBOutlet weak var PapyrusSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNavBarImage()
        
        fontDisplay.font = UIFont(name: fontSet, size: 20)
        AvenirNextLabel.font = UIFont(name: "Avenir Next", size: 18)
        AmericanTypewriterLabel.font = UIFont(name: "American Typewriter", size: 18)
        MenloRegularLabel.font = UIFont(name: "Menlo-Regular", size: 18)
        PapyrusLabel.font = UIFont(name: "Papyrus", size: 18)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        fontDisplay.font = UIFont(name: fontSet, size: 20)
        
        let index = font.firstIndex(of: fontSet)
        AvenirNextSwitch.setOn(0 == index, animated: true)
        AmericanTypewriterSwitch.setOn(1 == index, animated: true)
        MenloRegularSwitch.setOn(2 == index, animated: true)
        PapyrusSwitch.setOn(3 == index, animated: true)
        
    }
    
    @IBAction func AvenirNextPicked(_ sender: UISwitch) {
        
        if sender.isOn == true{
            fontSet = font[0]
            AmericanTypewriterSwitch.setOn(false, animated: true)
            MenloRegularSwitch.setOn(false, animated: true)
            PapyrusSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
    
    @IBAction func AmericanTypewriterPicked(_ sender: UISwitch) {
        if sender.isOn == true{
            fontSet = font[1]
            AvenirNextSwitch.setOn(false, animated: true)
            MenloRegularSwitch.setOn(false, animated: true)
            PapyrusSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
    
    @IBAction func MenloRegularPicked(_ sender: UISwitch) {
        
        if sender.isOn == true{
            fontSet = font[2]
            AvenirNextSwitch.setOn(false, animated: true)
            AmericanTypewriterSwitch.setOn(false, animated: true)
            PapyrusSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
    
    @IBAction func PapyrusPicked(_ sender: UISwitch) {
        
        if sender.isOn == true{
            fontSet = font[3]
            AvenirNextSwitch.setOn(false, animated: true)
            AmericanTypewriterSwitch.setOn(false, animated: true)
            MenloRegularSwitch.setOn(false, animated: true)
            viewWillAppear(true)
        }
    }
    
    func addNavBarImage() {
        
        var titleView = UIView(frame: CGRectMake(0, 0, 130, 40))
        var titleImageView = UIImageView(image: UIImage(named: "banner1"))
        titleImageView.frame = CGRectMake(0, 0, titleView.frame.width, titleView.frame.height)
        titleView.addSubview(titleImageView)
        navigationItem.titleView = titleView
    }
    
}
    
    
    
    
    

    

