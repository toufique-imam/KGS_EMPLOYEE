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
        }else if(key==User.key_dept){
            self.department = value
            return true
        }else{
            return false
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
    //MARK: gets current user name and password then fetch the full data from main array
    func getCurrentUser()->User?{
        //checks if current user is set
        if(self.user != nil) {
            return self.user
        }
        //otherwise first get the username and password
        let standardUserDefaults = UserDefaults.standard
        let decoder = JSONDecoder()
        if let currentUser = standardUserDefaults.object(forKey: CurrentUser.loginKey) as? Data {
            if let objectsDecoded = try? decoder.decode(User.self, from: currentUser) as User {
                //gets the total info from getCurrentUser
                return getUser(for: objectsDecoded) ?? objectsDecoded
            }
        }
        return nil
    }
    
    func getAllUsers()->[User] {
        if let objects = UserDefaults.standard.value(forKey: CurrentUser.users) as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [User] {
                return objectsDecoded
            }
        }
        return []
    }
    
    //MARK: fetchs the full data from main array given user name and password
    private func getUser(for userT: User)->User? {
        let savedUsers = getAllUsers()
        
        for suser in savedUsers {
            if(userT.name==suser.name && userT.password==suser.password){
                return suser
            }
        }
        return nil
    }
    //MARK: Checks if any user is logged in
    func isLoggedIn()->Bool {
        self.user = getCurrentUser()
        return self.user != nil
    }
    
    func logout(){
        self.user = nil
        let standardUserDefaults = UserDefaults.standard
        standardUserDefaults.removeObject(forKey: CurrentUser.loginKey)
    }
    
    //MARK: set login user info
    func setLoginUser(user : User) {
        if let userOld = self.user {
            print("new " , user.name , user.password)
            print("old " , userOld.name , userOld.password)
            updateUser(userOld: userOld, userNew: user)
        }
        self.user = user
        let standardUserDefaults = UserDefaults.standard
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user){
            standardUserDefaults.set(encoded, forKey: CurrentUser.loginKey)
        }
    }
    //MARK: checks and login the user
    func login(user:User)->Bool{
        //checks if the user is present
        if(checkLoginInfo(user: user)){
            //fetches the total info for the user
            self.user = getUser(for: user)
            //set the user as current login
            setLoginUser(user: self.user!)
            return true
        }else{
            return false
        }
    }
    
    //MARK: checks login info using username and password
    func checkLoginInfo(user:User)->Bool {
        return getUser(for: user) != nil
    }
    
    
    //MARK: replaces the userold with usernew
    //findx the index and then replaces it
    func updateUser(userOld : User , userNew : User) {
        var savedUsers = getAllUsers()
        
        var idxDel = -1
        for (idx , suser) in savedUsers.enumerated() {
            if(userOld.name==suser.name && userOld.password==suser.password){
                idxDel = idx
            }
        }
        if(idxDel != -1){
            savedUsers.remove(at: idxDel)
        }
        savedUsers.append(userNew)
        
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(savedUsers){
            UserDefaults.standard.set(encoded, forKey: CurrentUser.users)
        }
    }
    
    
    func addUser(user: User){
        var savedUsers = getAllUsers()
        
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
