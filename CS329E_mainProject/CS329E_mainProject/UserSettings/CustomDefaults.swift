//
//  CustomDefaults.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/8/22.
//

import Foundation

class CustomDefaults{
    
   public let userCustomizations = UserDefaults.standard
        
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
    
    func setUp()
    {
        userCustomizations.set(name, forKey: uNameKey)
        userCustomizations.set(birthday, forKey: uBirthdayKey)
        userCustomizations.set(font, forKey: uFontKey)
    }
        
    func setName(newName:String)
    {
        userCustomizations.set(newName, forKey: uNameKey)
    }
    
    func setBirthday(newBirthday:String)
    {
        userCustomizations.set(newBirthday, forKey: uBirthdayKey)
    }
    
    func setFont(newFont:String)
    {
        userCustomizations.set(newFont, forKey: uFontKey)
    }
    
    func setDiet(dietChoices:[String])
    {
        userCustomizations.set(diet, forKey: uDietKey)
    }
    
    func getName() -> String
    {
        return userCustomizations.string(forKey: uNameKey)!
    }
    
    func getBirthday() -> String
    {
        return userCustomizations.string(forKey: uBirthdayKey)!
    }
    
    func getFont() -> String
    {
        return userCustomizations.string(forKey: uFontKey)!
    }
    
    func getDiet() -> [String]
    {
        return (userCustomizations.array(forKey: uDietKey) as? [String])!
    }
}
