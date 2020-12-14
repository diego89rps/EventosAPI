//
//  ResumeNoRegisterStateView.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 12/12/20.
//

import UIKit

class ResumeNoRegisterStateView: UIView, ViewCodeType {

    let image : UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFit
        $0.image = #imageLiteral(resourceName: "noRgister")
        return $0
    }(UIImageView())
    
    let reloadBtn: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("tentar novamente", for: .normal)
        $0.setTitleColor(.defaultColor(ColorName.defaultDarkBlue), for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
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
    
    func setupView() {
        addSubviews()
        setupConstraints()
    }
    
    func addSubviews() {
        addSubview(image)
        addSubview(reloadBtn)
    }
    
    func setupConstraints() {
        setupImage()
        setupReloadBtn()
    }
    
    func setupImage() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    func setupReloadBtn() {
        NSLayoutConstraint.activate([
            reloadBtn.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            reloadBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            reloadBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            reloadBtn.heightAnchor.constraint(equalToConstant: 52)
        ])
    }
}
