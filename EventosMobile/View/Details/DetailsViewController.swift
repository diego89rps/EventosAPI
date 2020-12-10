//
//  DetailsViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class DetailsViewController: AppDefaultViewController {
    typealias CustomView = DetailsView
    
    var coordinator: MainCoordinator?
    let customView = CustomView()
    let disposeBag = DisposeBag()
    var viewModel : ResumeViewModel?
    var index : Int?
    
    override func loadView() {
        super.loadView()
        view = customView
        setupDetails()
        bind()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupDetails() {
        self.title = viewModel?.getTitle(indexPath: index!)
        customView.dateAndCost.text = "\(viewModel?.getDateFormat(indexPath: index!) ?? "") - \(viewModel?.getCost(indexPath: index!) ?? "")"
        customView.textView.text = viewModel?.getDescription(indexPath: index!)
        
        viewModel?.getImage(indexPath: index!) { (results) in
            switch results {
            case .success(let data):
                self.customView.image.image = UIImage(data: data)
            case .failure(_):
                self.customView.image.image = #imageLiteral(resourceName: "notRegister")
            }
        }
    }
    
    private func bind() {
        customView
            .mapBtn
            .rx
            .tap
            .bind { [weak self] (_) in
                   self?.goToMap()
            }.disposed(by: disposeBag)
    }
    
    private func goToMap() {
        self.coordinator?.goToMap()
    }
}
