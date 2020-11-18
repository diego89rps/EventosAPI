//
//  DetailsView.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import Foundation

import UIKit
import RxSwift

class DetailsView: UIView, ViewCodeType {
    
    // MARK: Views
    
    let scrollView : UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIScrollView())

    let image : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    let dateAndCost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .averta(.semibold, withSize: 18)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.text = "14 de janeiro de 2020 - R$ 9,00"
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let textView: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .averta(.regular, withSize: 15)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let checkInBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Fazer Check-in", for: .normal)
        $0.setTitleColor(.defaultColor(ColorName.defaultDarkBlue), for: .normal)
        $0.titleLabel?.font = .averta(.semibold, withSize: 16)
        $0.titleLabel?.textAlignment = .left
        $0.backgroundColor = .defaultColor(ColorName.defaultWhite)
        $0.layer.cornerRadius = 12
        return $0
    }(UIButton())
    
    let shareBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Compartilhar", for: .normal)
        $0.setTitleColor(.defaultColor(ColorName.defaultWhite), for: .normal)
        $0.titleLabel?.font = .averta(.regular, withSize: 16)
        $0.titleLabel?.textAlignment = .left
        $0.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
        $0.layer.cornerRadius = 12
        return $0
    }(UIButton())
    
    let mapBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Como chegar", for: .normal)
        $0.setTitleColor(.defaultColor(ColorName.defaultWhite), for: .normal)
        $0.titleLabel?.font = .averta(.regular, withSize: 16)
        $0.titleLabel?.textAlignment = .left
        $0.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
        $0.layer.cornerRadius = 12
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
        backgroundColor = .defaultColor(ColorName.defaultMediumBlue)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(image)
        scrollView.addSubview(dateAndCost)
        scrollView.addSubview(textView)
        scrollView.addSubview(checkInBtn)
        scrollView.addSubview(shareBtn)
        scrollView.addSubview(mapBtn)
    }
    
    // MARK: Constraints setup
    func setupConstraints() {
        setupScrollView()
        setupiImage()
        setupDateAndCost()
        setupTextView()
        setupCheckInBtn()
        setupShareBtn()
        setupMapBtn()
    }
    
    private func setupScrollView() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func setupiImage() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: scrollView.topAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    private func setupDateAndCost() {
        NSLayoutConstraint.activate([
            dateAndCost.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 28),
            dateAndCost.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    private func setupTextView() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: dateAndCost.bottomAnchor, constant: 15),
            textView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func setupCheckInBtn() {
        NSLayoutConstraint.activate([
            checkInBtn.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 28),
            checkInBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            checkInBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            checkInBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func setupShareBtn() {
        NSLayoutConstraint.activate([
            shareBtn.topAnchor.constraint(equalTo: checkInBtn.bottomAnchor, constant: 8),
            shareBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            shareBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            shareBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
    
    private func setupMapBtn() {
        NSLayoutConstraint.activate([
            mapBtn.topAnchor.constraint(equalTo: shareBtn.bottomAnchor, constant: 8),
            mapBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            mapBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mapBtn.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),

            mapBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}
