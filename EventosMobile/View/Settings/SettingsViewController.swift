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
        bindOutPuts()
    }
    
    private func bindOutPuts() {
        _ = viewModel.status()
        customView.image.image = viewModel.getImage()
        customView.name.text = viewModel.getName()
        customView.email.text = viewModel.getEmail()
        customView.button.backgroundColor = viewModel.getColorBtn()
        customView.button.setTitle(viewModel.getStatusBtn(), for: .normal)
        customView.button.setTitleColor(viewModel.getTextColorBtn(), for: .normal)
    }
}

