//
//  MapView.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit
import MapKit

class MapView: UIView, ViewCodeType {
    
    // MARK: Views
    let mapView: MKMapView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(MKMapView())
    
    let closeButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "closePresentView")!, for: .normal)
        return $0
    }(UIButton())
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: Setup View
    func setupView() {
        backgroundColor = .defaultColor(ColorName.defaultWhite)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(mapView)
        mapView.addSubview(closeButton)
    }
    
    // MARK: Constraints setup
    func setupConstraints() {
        setupMapView()
        setupCloseButton()
    }
    
    private func setupMapView() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            mapView.centerXAnchor.constraint(equalTo: centerXAnchor),
            mapView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    private func setupCloseButton() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -20),
        ])
    }
}
