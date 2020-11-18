//
//  EmailViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 18/11/20.
//

import UIKit
import RxSwift
import RxCocoa

class NameViewController: AppDefaultViewController {
    typealias CustomView = NameView
    //typealias ViewModel = GoalViewModel
    
    //var vm: ViewModel
    let customView = CustomView()
    var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()
    
//    init(with viewModel: GoalViewModel) {
//        self.vm = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtonsBehaviour()
        customView.confirmButton.isEnabled = false
        customView.textField.becomeFirstResponder()
        bind()
    }
    
    private func bind() {
        bindInputs()
    }
    
    private func bindInputs() {
        customView
            .confirmButton
            .rx
            .tap
            .bind {
                self.setName()
            }.disposed(by: disposeBag)


    }
    
    func setName(){
//        let name = self.customView.textField.text!
//        vm.setName(name: name)
//        self.coordinator?.goToGoalCostView(vm: vm)
    }
    
    private func setupButtonsBehaviour() {
        let nameValidation = customView.textField.rx.text.map({!($0!.count < 3)}).share(replay: 1)
        
        let enableButton = nameValidation
            .asObservable()
            .map { $0 }
            .share(replay: 1)
        
        enableButton
            .bind(to: customView.confirmButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
}
