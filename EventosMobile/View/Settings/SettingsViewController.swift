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
        } else {
            userNotRegister()
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
    
    private func userNotRegister(){
        customView.image.image = #imageLiteral(resourceName: "notRegister")
        customView.name.text = "Ops!"
        customView.email.text = "Você não possui cadastro! Cadastre-se para participar de eventos."
        customView.button.backgroundColor = .defaultColor(ColorName.defaultWhite)
        customView.button.setTitle("Realizar cadastro", for: .normal)
        customView.button.setTitleColor(.defaultColor(ColorName.defaultDarkBlue), for: .normal)
    }
}

