//
//  SettingsVMTests.swift
//  EventosMobileTests
//
//  Created by Diego Ribeiro on 13/12/20.
//

import XCTest
@testable import EventosMobile

class SettingsVMTests: XCTestCase {
    
    func test_setName_addsNameToUserModel() {
        let sut = isRegisterWhenTrue()
        
        sut.setName(name: "Diego")
        
        XCTAssertEqual(sut.getName(), "Diego")
    }
    
    func test_setEmail_addsEmailToUserModel() {
        let sut = isRegisterWhenTrue()
        
        sut.setEmail(email: "di_rps@hotmail.com")
        
        XCTAssertEqual(sut.getEmail(), "di_rps@hotmail.com")
    }
    
    func test_createRegister_addUserOnUserDefaults() {
        let sut = addUser()
        
        sut.createRegister()
        
        XCTAssertEqual(sut.getName(), UserDefaults.standard.string(forKey: "userName"))
        XCTAssertEqual(sut.getEmail(), UserDefaults.standard.string(forKey: "userEmail"))
    }
    
    func test_deleteRegister_addUserOnUserDefaults() {
        let sut = userDefaultsRegister()
        
        sut.deleteRegister()
        
        XCTAssertNil(UserDefaults.standard.string(forKey: "userName"))
        XCTAssertNil(UserDefaults.standard.string(forKey: "userEmail"))
    }
    
    func test_status_existUserOnUserDefaults() {
        let sut = userDefaultsRegister()
        
        let result = sut.status()
        
        XCTAssertTrue(result)
    }
    
    func test_status_dontExistUserOnUserDefaults() {
        let sut = userDefaultsNotRegister()
        
        let result = sut.status()
        
        XCTAssertFalse(result)
    }
    
    //MARK: Helper
    func isRegisterWhenTrue() -> SettingsViewModel{
        let sut = SettingsViewModel()
        sut.isRegister = true
        
        return sut
    }
    func addUser() -> SettingsViewModel{
        let sut = SettingsViewModel()
        sut.isRegister = true
        sut.setName(name: "Diego")
        sut.setEmail(email: "di_rps@hotmail.com")
        
        return sut
    }
    
    func userDefaultsRegister() -> SettingsViewModel{
        let sut = SettingsViewModel()
        UserDefaults.standard.set("Diego", forKey: "userName")
        UserDefaults.standard.set("di_rps@hotmail.com", forKey: "userEmail")
        
        return sut
    }
    func userDefaultsNotRegister() -> SettingsViewModel{
        let sut = SettingsViewModel()
        UserDefaults.standard.set(nil, forKey: "userName")
        UserDefaults.standard.set(nil, forKey: "userEmail")
        
        return sut
    }
}
