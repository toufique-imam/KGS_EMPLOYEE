//
//  User.swift
//  KGS Employee
//
//  Created by Nuhash on 5/24/22.
//

import Foundation
import UIKit


class User : Codable {
    
    var name:String
    var password:String
    var fullName:String
    var designation:String
    var phone:String
    var email:String
    var department:String
    var imagePath:String
    
    
    init(name:String = "placeholder name", password:String = "placeholder password",fullName:String = "full name placeholder",
     designation:String="designation placeholder",
     phone:String="01521108127",
     email:String="placeholder@gmail.com",
     department:String="ios-placeholder",
    imagePath:String="placeholderpath"
    ) {
        
        self.name = name
        self.password = password
        self.fullName = fullName
        self.designation = designation
        self.phone = phone
        self.email = email
        self.department = department
        self.imagePath = imagePath
        
    }
    
//    required convenience init(coder aDecoder : NSCoder) {
//
//        let name = aDecoder.decodeObject(forKey: "name") as! String
//        let password = aDecoder.decodeObject(forKey: "password") as! String
//        let fullName = aDecoder.decodeObject(forKey: "fullName") as! String
//        let designation = aDecoder.decodeObject(forKey: "designation") as! String
//        let phone = aDecoder.decodeObject(forKey: "phone") as! String
//        let email = aDecoder.decodeObject(forKey: "email") as! String
//        let department = aDecoder.decodeObject(forKey: "department") as! String
//        let imagePath = aDecoder.decodeObject(forKey: "imagePath") as! String
//
//        self.init(name: name, password: password, fullName: fullName, designation: designation, phone: phone, email: email, department: department, imagePath: imagePath)
//    }
//
//    func encode(with coder: NSCoder) {
//        coder.encode(self.name , forKey: self.name.self)
//        coder.encode(self.password , forKey: self.password.self)
//        coder.encode(self.fullName , forKey: self.fullName.self)
//        coder.encode(self.designation , forKey: self.designation.self)
//        coder.encode(self.phone , forKey: self.phone.self)
//        coder.encode(self.email , forKey: self.email.self)
//        coder.encode(self.imagePath , forKey: self.imagePath.self)
//    }
}

class CurrentUser {
    private var user : User? = nil
    static let loginKey = "LoggedUser"
    static let users = "users"
    
    static let shared = CurrentUser()
    
    private init(){
        
    }
    
    func getCurrentUser()->User?{
        let standardUserDefaults = UserDefaults.standard
        return standardUserDefaults.object(forKey: CurrentUser.loginKey) as? User ?? nil
    }
    func isLoggedIn()->Bool {
        user = getCurrentUser()
        return self.user != nil
    }
    func logout(){
        user = nil
    }
    func login(user:User)->Bool{
        if(checkLoginIngo(user: user)){
            self.user = user
            let standardUserDefaults = UserDefaults.standard
            
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(user){
                standardUserDefaults.set(encoded, forKey: CurrentUser.loginKey)
            }
            return true 
        }else{
            return false
        }
    }
    func checkLoginIngo(user:User)->Bool {
        //TODO: check user name and password in UserDefaults
        var savedUsers: [User] = []
        if let objects = UserDefaults.standard.value(forKey: CurrentUser.users) as? Data {
           let decoder = JSONDecoder()
           if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [User] {
              savedUsers = objectsDecoded
           }
        }
        
        for suser in savedUsers {
            print(suser.name , suser.password)
            if(user.name==suser.name && user.password==suser.password){
                return true
            }
        }
        return false
    }
    

    func addUser(user: User){
        var savedUsers: [User] = []
        if let objects = UserDefaults.standard.value(forKey: CurrentUser.users) as? Data {
           let decoder = JSONDecoder()
           if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [User] {
              savedUsers = objectsDecoded
           }
        }
        
        
        for suser in savedUsers {
            if(user.name==suser.name && user.password==suser.password){
                return
            }
        }
        savedUsers.append(user)
        
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(savedUsers){
            UserDefaults.standard.set(encoded, forKey: CurrentUser.users)
        }
    }
    
}
