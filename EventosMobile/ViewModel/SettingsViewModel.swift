//
//  SettingsViewModel.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 18/11/20.
//

import Foundation
import UIKit

class SettingsViewModel{
    
    private var user : User = User.init()
    var isRegister : Bool?
    
    init() {
        _ = status()
    }
    
    func status() -> Bool {
        if let name = UserDefaults.standard.string(forKey: "userName"),
           let email = UserDefaults.standard.string(forKey: "userEmail"){
            user.name = name
            user.email = email
            isRegister = true
            return true
        } else {
            isRegister = false
            return false
        }
    }
    
    //MARK: SETUP OUTPUTS
    func getImage() -> UIImage {
        return isRegister == true ? #imageLiteral(resourceName: "withRegister") : #imageLiteral(resourceName: "notRegister")
    }
    
    func getName() -> String {
        return isRegister == true ? user.name ?? "user not found" : "Ops!"
    }
    
    func getEmail() -> String {
        return isRegister == true ? user.email ?? "email not found" : "Você não possui cadastro! Cadastre-se para participar de eventos."
    }
    
    func getColorBtn() -> UIColor {
        return isRegister == true ? .defaultColor(ColorName.defaultLightBlue) : .defaultColor(ColorName.defaultWhite)
    }
    
    func getStatusBtn() -> String {
        return isRegister == true ? "Sair" : "Realizar cadastro"
    }
    
    func getTextColorBtn() -> UIColor {
        return isRegister == true ? .defaultColor(ColorName.defaultWhite) : .defaultColor(ColorName.defaultDarkBlue)
    }
    
    // MARK: Resgister flow
    func setName(name : String) {
        user.name = name
    }
    
    func setEmail(email : String) {
        user.email = email
    }
    
    func createRegister() {
        UserDefaults.standard.set(user.name, forKey: "userName")
        UserDefaults.standard.set(user.email, forKey: "userEmail")
    }
    
    //MARK: Delete Register
    func deleteRegister() {
        UserDefaults.standard.set(nil, forKey: "userName")
        UserDefaults.standard.set(nil, forKey: "userEmail")
    }
}
