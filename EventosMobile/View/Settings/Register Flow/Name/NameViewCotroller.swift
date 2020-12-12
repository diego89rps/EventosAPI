//
//  NameViewCotroller.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 18/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class NameViewController: AppDefaultViewController {
    typealias CustomView = NameView
    typealias ViewModel = SettingsViewModel
    
    let viewModel = ViewModel()
    let customView = CustomView()
    var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()
    
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
            .bind {
                self.continueResgister()
            }.disposed(by: disposeBag)
    }
    
    func continueResgister(){
        let name = self.customView.textField.text!
        viewModel.setName(name: name)
        self.coordinator?.goToEmail(viewModel: viewModel)
    }
}

extension NameViewController: UITextFieldDelegate {
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
