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
    
    var coordinator: MainCoordinator?
    let customView = CustomView()
    let disposeBag = DisposeBag()
    
    override func loadView() {
        super.loadView()
        view = customView
        
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
                let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: span)
        customView.mapView.setRegion(region, animated: true)
        
        let london = EventAdress(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
        
        customView.mapView.addAnnotation(london)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        customView
            .closeButton
            .rx
            .tap
            .bind {
                self.dismiss(animated: true)
            }.disposed(by: disposeBag)

    }
}

