//
//  ResumeView.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit

class ResumeView: UIView, ViewCodeType {
    
    // MARK: Views
    let title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Eventos"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    let tableView: UITableView = {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.layer.masksToBounds = true
        $0.clipsToBounds = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(ResumeViewCell.self, forCellReuseIdentifier: ResumeViewCell.description())
        return $0
    }(UITableView())
    
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
        addSubview(tableView)
    }
    
    // MARK: Constraints setup
    func setupConstraints() {
        setupTitle()
        setupTableView()
    }
    
    private func setupTitle() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
    private func setupTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 27),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
