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
        
        //values for associated keys
        let name = "Jane Doe"
        let birthday = "07/17/1999"
        let font = "Avenir Next"
    
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
    
    func getName(newName:String) -> String
    {
        return userCustomizations.string(forKey: uNameKey)!
    }
    
    func getBirthday(newBirthday:String) -> String
    {
        return userCustomizations.string(forKey: uBirthdayKey)!
    }
    
    func getFont(newFont:String) -> String
    {
        return userCustomizations.string(forKey: uFontKey)!
    }
    
}
