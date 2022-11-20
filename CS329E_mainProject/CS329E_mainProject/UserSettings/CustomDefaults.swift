//
//  CustomDefaults.swift
//  CS329E_mainProject
//
//  Created by Eddith Figueroa on 11/8/22.
//

import Foundation

class CustomDefaults{
    
    //create a UserDefaults variable called userCustomizations
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
    
    //method that creates the UserDefaults and sets the initial values of each key
    func setUp()
    {
        userCustomizations.set(name, forKey: uNameKey)
        userCustomizations.set(birthday, forKey: uBirthdayKey)
        userCustomizations.set(font, forKey: uFontKey)
        userCustomizations.set(diet, forKey: uDietKey)
    }
    
    //method that allows the value of uNameKey to be changed
    func setName(newName:String)
    {
        userCustomizations.set(newName, forKey: uNameKey)
    }
    
    //method that allows the value of uBirthdayKey to be changed
    func setBirthday(newBirthday:String)
    {
        userCustomizations.set(newBirthday, forKey: uBirthdayKey)
    }
    
    //method that allows the value of uFontKey to be changed
    func setFont(newFont:String)
    {
        userCustomizations.set(newFont, forKey: uFontKey)
    }
    
    //method that allows the value of uDietKey to be changed
    func setDiet(dietChoices:[String])
    {
        userCustomizations.set(diet, forKey: uDietKey)
    }
    
    //method that returns the value stored in uNameKey
    func getName() -> String
    {
        return userCustomizations.string(forKey: uNameKey)!
    }
    
    //method that returns the value stored in uBirthdayKey
    func getBirthday() -> String
    {
        return userCustomizations.string(forKey: uBirthdayKey)!
    }
    
    //method that returns the value stored in uFontKey
    func getFont() -> String
    {
        return userCustomizations.string(forKey: uFontKey)!
    }
    
    //method that returns the value stored in uDietKey
    func getDiet() -> [String]
    {
        return (userCustomizations.array(forKey: uDietKey) as? [String])!
    }
}
