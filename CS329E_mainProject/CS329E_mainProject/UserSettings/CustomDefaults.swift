//
//  CustomDefaults.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/8/22.
//

import Foundation

public let userCustomizations = UserDefaults.standard

class CustomDefaults{
    
        //keys for defaults
        let uNameKey = "user name"
        let uBirthdayKey = "birthday"
        let uFontKey = "font"
        let uDietKey = "diet"
        
        //values for associated keys
        let name = "Jane Doe"
        let birthday = "07/17/1999"
        let font = "Avenir Next"
        let diet = ["none"]
    
    //method that creates the UserDefaults and sets the initial values of each key
    func setUp()
    {
        userCustomizations.set(name, forKey: uNameKey)
        userCustomizations.set(birthday, forKey: uBirthdayKey)
        userCustomizations.set(font, forKey: uFontKey)
        userCustomizations.set(diet, forKey: uDietKey)
    }
}
