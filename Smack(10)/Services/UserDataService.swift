//
//  UserDataService.swift
//  Smack(10)
//
//  Created by Maksim Egorov on 11/15/19.
//  Copyright © 2019 Maksim Egorov. All rights reserved..
//

import Foundation

class UserDataService {
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColor = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    public private(set) var user = ""
   
    func setUserData(id:String, color: String, avatarName: String, email: String, name: String){
        self.id = id
        self.avatarColor = color
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
    func returnUIColor(components: String)-> UIColor{
        let scanner = Scanner(string: components)
        let skipped = CharacterSet(charactersIn: "[], ")
        let comma = CharacterSet(charactersIn: ",")
        scanner.charactersToBeSkipped = skipped
        
        var r, g, b, a : NSString?
        scanner.scanUpToCharacters(from: comma, into: &r)
        scanner.scanUpToCharacters(from: comma, into: &g)
        scanner.scanUpToCharacters(from: comma, into: &b)
        scanner.scanUpToCharacters(from: comma, into: &a)
        
        let defaulColor = UIColor.lightGray
        
        guard let rUnwrapped = r else {return defaulColor}
        guard let gUnwrapped = g else {return defaulColor}
        guard let bUnwrapped = b else {return defaulColor}
        guard let aUnwrapped = a else {return defaulColor}
        
        let rfloat = CGFloat(rUnwrapped.doubleValue)
        let gfloat = CGFloat(gUnwrapped.doubleValue)
        let bfloat = CGFloat(bUnwrapped.doubleValue)
        let afloat = CGFloat(aUnwrapped.doubleValue)
        
        let newUIColor = UIColor(red: rfloat, green: gfloat, blue: bfloat, alpha: afloat)
        
        return newUIColor
        
    }
    
    func logoutUser() {
        id = ""
        avatarName = ""
        avatarColor = ""
        email = ""
        name = ""
        AuthService.instance.isLoggedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        MessageService.instance.clearChannels()
        MessageService.instance.clearMessages()
    }
    
//    func setupNoAuthUser() {
//        id = "111UserID"
//        avatarName = "dark56767676"
//        avatarColor = "[0.9529411764705882, 0.9607843137254902, 0.5215686274509804, 1]"
//        user = "test@test.test"
//        name = "stubName"
//        AuthService.instance.isLoggedIn = true
//        AuthService.instance.userEmail = "test@test.test"
//        AuthService.instance.authToken = "123STUBTOKEN"
//        MessageService.instance.findAllChannel(completion: CopletionHandler)
//    }
}
