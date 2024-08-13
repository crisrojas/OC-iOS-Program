//
//  DetailView+setupUI.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import UIKit

// MARK: - UI methods
extension DetailView {
    func commonInit() {
        backgroundColor = .red
        setupConstraints()
        ingredientsTableView.showsVerticalScrollIndicator = false
    }
    
    func setupConstraints() {
        addSubview(picture)
        picture.image = UIImage(named: "recipe-placeholder")!
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: topAnchor),
            picture.leadingAnchor.constraint(equalTo: leadingAnchor),
            picture.trailingAnchor.constraint(equalTo: trailingAnchor),
            picture.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])
        
        addSubview(contentView)
        contentView.layer.cornerRadius = 44
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: -40),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(favoriteButton)
        NSLayoutConstraint.activate([
            favoriteButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            favoriteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            favoriteButton.heightAnchor.constraint(equalToConstant: 24),
            favoriteButton.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteButton.trailingAnchor, constant: -8)
        ])
        
        addSubview(getButton)
        NSLayoutConstraint.activate([
            getButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            getButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            getButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            getButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        contentView.addSubview(ingredientsTableView)
        NSLayoutConstraint.activate([
            ingredientsTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            ingredientsTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            ingredientsTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            ingredientsTableView.bottomAnchor.constraint(equalTo: getButton.topAnchor)
        ])
        
        addSubview(informationStackView)
        NSLayoutConstraint.activate([
            informationStackView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -12),
            informationStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
       
        ])
    }
}
