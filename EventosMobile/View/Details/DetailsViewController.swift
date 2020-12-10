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
    let viewModel : ResumeViewModel
    let index : Int
    
    init(viewModel: ResumeViewModel, index: Int) {
        self.viewModel = viewModel
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        self.title = viewModel.getTitle(indexPath: index)
        customView.dateAndCost.text = "\(viewModel.getDateFormat(indexPath: index)) - \(viewModel.getCost(indexPath: index))"
        customView.textView.text = viewModel.getDescription(indexPath: index)
        
        viewModel.getImage(indexPath: index) { (results) in
            switch results {
            case .success(let data):
                self.customView.image.image = UIImage(data: data)
            case .failure(_):
                self.customView.image.image = #imageLiteral(resourceName: "alert")
                self.customView.image.contentMode = .scaleAspectFit
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
        let longitude = viewModel.getLongitude(indexPath: index)
        let latitude = viewModel.getLatitude(indexPath: index)

        self.coordinator?.goToMap(with : longitude, latitude : latitude)
    }
}
