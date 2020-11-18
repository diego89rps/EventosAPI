//
//  SettingsViewModel.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 18/11/20.
//

import Foundation

class SettingsViewModel{
    
    private var user : User = User.init()
    
    func userResgister () -> Bool {
        if let name = UserDefaults.standard.string(forKey: "userName"),
           let email = UserDefaults.standard.string(forKey: "userEmail"){
            user.name = name
            user.email = email
            return true
        } else {
            return false
        }
    }
    
    func createRegister() {
        UserDefaults.standard.set(user.name, forKey: "userName")
        UserDefaults.standard.set(user.email, forKey: "userEmail")
    }
    
    func getName() -> String {
        return user.name  ?? "user not found"
    }
    
    func getEmail() -> String {
        return user.email ?? "email not found"
    }
    
    func setName(name : String) {
        user.name = name
    }
    
    func setEmail(email : String) {
        user.email = email
    }
}
