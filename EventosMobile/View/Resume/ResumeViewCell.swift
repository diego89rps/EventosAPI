//
//  ResumeViewCell.swift
//  EventosMobile
//
//  Created by Diego Ribeiro on 16/11/20.
//

import UIKit

class ResumeViewCell: UITableViewCell {
    
    private var viewHeight: CGFloat = 0
    private var viewWidth: CGFloat = 0
    
    // MARK: Views
    let cellContentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.layer.masksToBounds = true
        $0.backgroundColor = .defaultColor(ColorName.defaultLightBlue)
        $0.layer.cornerRadius = 12
        return $0
    }(UIView())
    
    let leftTitle: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .averta(.semibold, withSize: 22)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .left
        $0.text = "titulo"
        return $0
    }(UILabel())
    
    let date: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = .averta(.regular, withSize: 16)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .left
        $0.text = "data"
        return $0
    }(UILabel())
    
    let cost: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = .averta(.semibold, withSize: 22)
        $0.textColor = .defaultColor(ColorName.defaultWhite)
        $0.textAlignment = .left
        $0.text = "R$ 9.00"
        return $0
    }(UILabel())
    
    // MARK: Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup cell view
    private func setupView() {
        viewHeight = UIScreen.main.bounds.height
        viewWidth = UIScreen.main.bounds.width
        setupCell()
        addSubviews()
        setupConstraints()
    }
    
    private func setupCell() {
        translatesAutoresizingMaskIntoConstraints = true
        clipsToBounds = true
        layer.masksToBounds = true
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func addSubviews() {
        contentView.addSubview(cellContentView)
        cellContentView.addSubview(leftTitle)
        cellContentView.addSubview(date)
        cellContentView.addSubview(cost)
    }
    
    // MARK: Setup constraints
    private func setupConstraints() {
        setupCellContentView()
        setupLeftTitle()
        setupDate()
        setupCost()

    }
    
    private func setupCellContentView() {
        NSLayoutConstraint.activate([
            cellContentView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            cellContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cellContentView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            cellContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            cellContentView.heightAnchor.constraint(equalToConstant: 125)
        ])
    }
    
    private func setupLeftTitle() {
        NSLayoutConstraint.activate([
            leftTitle.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 30),
            leftTitle.topAnchor.constraint(equalTo: cellContentView.topAnchor, constant: 18),
            leftTitle.centerXAnchor.constraint(equalTo: cellContentView.centerXAnchor)
        ])
    }
    private func setupDate() {
        NSLayoutConstraint.activate([
            date.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 30),
            date.topAnchor.constraint(equalTo: leftTitle.bottomAnchor, constant: 11),
            date.centerXAnchor.constraint(equalTo: cellContentView.centerXAnchor)
        ])
    }
    private func setupCost() {
        NSLayoutConstraint.activate([
            cost.leadingAnchor.constraint(equalTo: cellContentView.leadingAnchor, constant: 30),
            cost.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 11),
            cost.centerXAnchor.constraint(equalTo: cellContentView.centerXAnchor)
        ])
    }
    
}
