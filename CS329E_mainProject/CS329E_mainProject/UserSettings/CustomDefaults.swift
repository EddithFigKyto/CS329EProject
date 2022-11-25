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
    let uColorKey = "color"
    let uChangedKey = "changed"
        
    //values for associated keys
    let name = "Jane Doe"
    let birthday = "07/17/1999"
    let font = "Avenir Next"
    let diet:[String] = [""]
    let color = "cyan"
    let changed:Bool = false
    
    //method that creates the UserDefaults and sets the initial values of each key
    func setUp()
    {
        if !userCustomizations.bool(forKey: uChangedKey){
            
            userCustomizations.set(name, forKey: uNameKey)
            userCustomizations.set(birthday, forKey: uBirthdayKey)
            userCustomizations.set(font, forKey: uFontKey)
            userCustomizations.set(diet, forKey: uDietKey)
            userCustomizations.set(color, forKey: uColorKey)
            userCustomizations.set(true, forKey: uChangedKey)
        }
    }
    
    
}
