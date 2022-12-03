//
//  InitialDietViewController.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/25/22.
//

import UIKit

class InitialDietViewController: UIViewController {
    
    
    @IBOutlet weak var instructionsLabel: UILabel!
    @IBOutlet weak var selectAllApplyLabel: UILabel!
    @IBOutlet weak var vegetarianLabel: UILabel!
    @IBOutlet weak var veganLabel: UILabel!
    @IBOutlet weak var glutenFreeLabel: UILabel!
    @IBOutlet weak var nutFreeLabel: UILabel!
    @IBOutlet weak var halalLabel: UILabel!
    
    @IBOutlet weak var vegetarianSwitch: UISwitch!
    @IBOutlet weak var veganSwitch: UISwitch!
    @IBOutlet weak var glutenFreeSwitch: UISwitch!
    @IBOutlet weak var nutFreeSwitch: UISwitch!
    @IBOutlet weak var halalSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func vegetarianSelected(_ sender: UISwitch) {
    }
    
    @IBAction func veganSelected(_ sender: UISwitch) {
    }
    
    @IBAction func glutenFreeSelected(_ sender: UISwitch) {
    }
    
    @IBAction func nutFreeSelected(_ sender: UISwitch) {
    }
    
    @IBAction func halalSelected(_ sender: UISwitch) {
    }
    

}
