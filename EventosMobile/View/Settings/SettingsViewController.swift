//
//  SettingsViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 17/11/20.
//

import UIKit

class SettingsViewController:  AppDefaultViewController {
    typealias CustomView = SettingsView
    //typealias ViewModel = ResumeViewModel
    //var detailsCallback: (String, String) -> Void = { _,_ in }
    
    let customView = CustomView()
    //let viewModel = ViewModel()
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userReguster()
    }
    private func userReguster(){
        customView.image.image = #imageLiteral(resourceName: "withRegister")
        customView.name.text = "Diego Ribeiro"
        customView.email.text = "diego@hotmail.com"
        customView.button.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
        customView.button.setTitle("Sair", for: .normal)
        customView.button.setTitleColor(.defaultColor(ColorName.defaultWhite), for: .normal)
    }
}

