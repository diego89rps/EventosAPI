//
//  EmailViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 18/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class EmailViewController: AppDefaultViewController {
    typealias CustomView = EmailView
    typealias ViewModel = SettingsViewModel
    
    let viewModel: ViewModel
    let customView = CustomView()
    var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()
    
    init(with viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView.textField.delegate = self
        customView.confirmButton.isEnabled = false
        customView.textField.becomeFirstResponder()
        bind()
    }
    
    private func bind() {
        customView
            .confirmButton
            .rx
            .tap
            .bind { [weak self] (_) in
                self?.finishResgister()
            }.disposed(by: disposeBag)
    }
    
    func finishResgister(){
        let email = self.customView.textField.text!
        viewModel.setEmail(email: email)
        viewModel.createRegister()
        self.coordinator?.popToRoot()
    }
}

extension EmailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if(string.isEmpty){
            if customView.textField.text!.count <= 3{
                customView.confirmButton.isEnabled = false
                customView.confirmButton.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
            }
            else{
                customView.confirmButton.isEnabled = true
                customView.confirmButton.backgroundColor = .defaultColor(ColorName.defaultWhite)
            }
        }else{
            if customView.textField.text!.count < 2{
                customView.confirmButton.isEnabled = false
                customView.confirmButton.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
            }
            else{
                customView.confirmButton.isEnabled = true
                customView.confirmButton.backgroundColor = .defaultColor(ColorName.defaultWhite)
            }
        }
        return true
    }
}
