//
//  SettingsViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 17/11/20.
//

import UIKit

class SettingsViewController:  AppDefaultViewController {
    typealias CustomView = SettingsView
    typealias ViewModel = SettingsViewModel
    
    let customView = CustomView()
    let viewModel = ViewModel()
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if viewModel.userResgister(){
            userRegister()
        }
    }
    
    private func userRegister(){
        customView.image.image = #imageLiteral(resourceName: "withRegister")
        customView.name.text = viewModel.getName()
        customView.email.text = viewModel.getEmail()
        customView.button.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
        customView.button.setTitle("Sair", for: .normal)
        customView.button.setTitleColor(.defaultColor(ColorName.defaultWhite), for: .normal)
    }
}

