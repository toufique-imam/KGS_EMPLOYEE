//
//  User.swift
//  KGS Employee
//
//  Created by Nuhash on 5/24/22.
//

import Foundation
import UIKit


class User : Codable {
    static let key_full_name = "Username"
    static let key_password = "Password"
    static let key_designation = "Designation"
    static let key_phone = "Phone"
    static let key_mail = "Email"
    static let key_dept = "Department"
    
    var name:String
    var password:String
    var fullName:String
    var designation:String
    var phone:String
    var email:String
    var department:String
    var imagePath:String
    
    func getValue(for key:String)->String{
        if(key==User.key_full_name){
            return fullName
        }else if(key==User.key_password){
            return password
        }else if(key==User.key_designation){
            return designation
        }else if(key==User.key_phone){
            return phone
        }else if(key==User.key_mail){
            return email
        }else{
            return department
        }
    }
    func updateValue(for key:String , value:String)->Bool{
        if(value.isEmpty){
            return false
        }
        if(key==User.key_full_name){
            self.fullName = value
            return true
        }else if(key==User.key_password){
            self.password = value
            return true
        }else if(key==User.key_designation){
            self.designation = value
            return true
        }else if(key==User.key_phone){
            self.phone = value
            return true
        }else if(key==User.key_mail && value.isValidEmail){
            self.email = value
            return true
        }else{
            self.department = value
            return true
        }
    }
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
    
    static func saveImage(_ image: UIImage, for user: User) {
        let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(user.name)
      if let jpgData = image.jpegData(compressionQuality: 0.7) {
        try? jpgData.write(to: imageURL, options: .atomicWrite)
      }
    }
    
    /// Loads and returns an image for a given book title.
    /// - Parameter title: Title of the book you need an image for.
    /// - Returns: The image associated with the given book title.
    static func loadImage(for user: User) -> UIImage? {
      let imageURL = FileManager.documentDirectoryURL.appendingPathComponent(user.name)
      return UIImage(contentsOfFile: imageURL.path)
    }
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
        let decoder = JSONDecoder()
        if let currentUser = standardUserDefaults.object(forKey: CurrentUser.loginKey) as? Data {
            if let objectsDecoded = try? decoder.decode(User.self, from: currentUser) as User {
                return objectsDecoded
            }
        }
        return nil
    }
    func isLoggedIn()->Bool {
        user = getCurrentUser()
        return self.user != nil
    }
    func logout(){
        user = nil
        let standardUserDefaults = UserDefaults.standard
        standardUserDefaults.removeObject(forKey: CurrentUser.loginKey)
    }
    func setLoginUser(user : User) {
        updateUser(userOld: self.user!, userNew: user)
        self.user = user
        let standardUserDefaults = UserDefaults.standard
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user){
            standardUserDefaults.set(encoded, forKey: CurrentUser.loginKey)
        }
    }
    func login(user:User)->Bool{
        if(checkLoginIngo(user: user)){
            setLoginUser(user: user)
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
    
    func updateUser(userOld : User , userNew : User) {
        var savedUsers: [User] = []
        if let objects = UserDefaults.standard.value(forKey: CurrentUser.users) as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [User] {
                savedUsers = objectsDecoded
            }
        }
        
        var idxDel = -1
        for (idx , suser) in savedUsers.enumerated() {
            if(userOld.name==suser.name && userOld.password==suser.password){
                idxDel = idx
            }
        }
        savedUsers.remove(at: idxDel)
        savedUsers.append(userNew)
        
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(savedUsers){
            UserDefaults.standard.set(encoded, forKey: CurrentUser.users)
        }
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
