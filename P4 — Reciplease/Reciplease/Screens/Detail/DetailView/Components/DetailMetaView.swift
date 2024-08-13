//
//  DetailMetaView.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import UIKit

class DetailMetaView: UIView {
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .textSmall
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    
    private func setupUI() {
        
        // MARK: - Form
        layer.cornerRadius = 12
        layer.masksToBounds = true
        backgroundColor = .darkerCream
        label.textColor = .paleBrown
        
        // MARK: - Costraints
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    func setLabel(_ label: String) {
        self.label.text = label
    }
    
}
