//
//  EmailView.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 18/11/20.
//

import UIKit

class NameView: UIView, ViewCodeType {
    
    // MARK: View
    let title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .defaultColor(.defaultWhite)
        $0.font = .averta(.extra_bold, withSize: 28)
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.text = "Para o que você\nestá economizando?"
        return $0
    }(UILabel())
    
    let textField: UITextField = {
        $0.autocapitalizationType = .none
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.borderStyle = .none
        $0.font = .averta(.extra_bold, withSize: 24)
        $0.textColor = .white
        $0.textAlignment = .center
        $0.autocorrectionType = .no
        return $0
    }(UITextField())
    
    let confirmButton: UIButton = {
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
        $0.backgroundColor = .defaultColor(ColorName.defaultWhite)
        $0.isHidden = true
        return $0
    }(UIButton())
    
    
    let stackView: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
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
            confirmButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 28),
            confirmButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            confirmButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}
