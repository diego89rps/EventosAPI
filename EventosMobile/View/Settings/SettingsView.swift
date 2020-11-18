//
//  SettingsView.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 17/11/20.
//

import UIKit

class SettingsView: UIView, ViewCodeType {
    
    // MARK: Views
    let title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Configurações"
        $0.font = .averta(.extra_bold, withSize: 30)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let image : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = #imageLiteral(resourceName: "notRegister")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    let name: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Ops!"
        $0.font = .averta(.semibold, withSize: 24)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let email: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Você não possui cadastro! Cadastre-se para participar de eventos."
        $0.font = .averta(.regular, withSize: 17)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    let button: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Realizar cadastro", for: .normal)
        $0.setTitleColor(.defaultColor(ColorName.defaultDarkBlue), for: .normal)
        $0.titleLabel?.font = .averta(.semibold, withSize: 16)
        $0.titleLabel?.textAlignment = .left
        $0.backgroundColor = .defaultColor(ColorName.defaultWhite)
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
        addSubview(title)
        addSubview(image)
        
        addSubview(name)
        addSubview(email)
        addSubview(button)
    }
    
    // MARK: Constraints setup
    func setupConstraints() {
        setupTitle()
        setupiImage()
        
        setupName()
        setupEmail()
        setupButton()
    }
    
    private func setupTitle() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    private func setupiImage() {
        NSLayoutConstraint.activate([
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -100),
            image.heightAnchor.constraint(equalToConstant: 110),
            image.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    private func setupName() {
        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            name.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            name.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    private func setupEmail() {
        NSLayoutConstraint.activate([
            email.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 11),
            email.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            email.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func setupButton() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 25),
            button.centerXAnchor.constraint(equalTo: centerXAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}
