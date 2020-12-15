//
//  MapViewController.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import Foundation
import UIKit
import MapKit
import RxSwift
import RxCocoa

class MapViewController: AppDefaultViewController {
    typealias CustomView = MapView
    typealias ViewModel = MapViewModel
    
    var coordinator: MainCoordinator?
    let disposeBag = DisposeBag()
    
    let customView = CustomView()
    let viewModel : MapViewModel
    
    init(latitude: Double, longitude: Double) {
        self.viewModel = ViewModel(latitude: latitude, longitude: longitude)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        bind()
    }
    
    func setupMap() {
        let region = viewModel.getRegion()
        customView.mapView.setRegion(region, animated: true)
        
        let eventAnotation = viewModel.getAnotation()
        customView.mapView.addAnnotation(eventAnotation)
    }
    
    func bind() {
        customView
            .closeButton
            .rx
            .tap
            .bind { [weak self] (_) in
                self?.dismiss(animated: true)
            }.disposed(by: disposeBag)
    }
}

