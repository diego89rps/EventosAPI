//
//  EmailView.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 18/11/20.
//

import UIKit

class EmailView: UIView, ViewCodeType {
    
    // MARK: View
    let title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .defaultColor(.defaultWhite)
        $0.font = .averta(.semibold, withSize: 28)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "Qual o seu e-mail?"
        return $0
    }(UILabel())
    
    let textField: UITextField = {
        $0.autocapitalizationType = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .none
        $0.font = .averta(.regular, withSize: 24)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .center
        $0.autocorrectionType = .no
        $0.placeholder = "email@dominio.com"
        return $0
    }(UITextField())
    
    let confirmButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Confirmar", for: .normal)
        $0.setTitleColor(.defaultColor(ColorName.defaultDarkBlue), for: .normal)
        $0.titleLabel?.font = .averta(.semibold, withSize: 16)
        $0.titleLabel?.textAlignment = .left
        $0.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
        $0.layer.cornerRadius = 12
        return $0
    }(UIButton())
    
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 70
        return $0
    }(UIStackView())
    
    
    // MARK: Initializers
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: Setup layout
    func setupView() {
        backgroundColor = .defaultColor(ColorName.defaultMediumBlue)
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(textField)
        addSubview(stackView)
        addSubview(confirmButton)
    }
    
    // MARK: Constraints setup
    func setupConstraints() {
        setupStackview()
        setupTitle()
        setupTextfield()
        setupConfirmButton()
    }
    
    private func setupStackview() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    private func setupTitle() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.topAnchor.constraint(equalTo: stackView.topAnchor),
            title.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 50),
        ])
    }
    
    private func setupTextfield() {
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 35),
            textField.centerXAnchor.constraint(equalTo: centerXAnchor),
            textField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 25)
        ])
    }
    
    private func setupConfirmButton() {
        NSLayoutConstraint.activate([
            confirmButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            confirmButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
