//
//  DefaultButton.swift
//  Baluchon
//
//  Created by Cristian Rojas on 06/02/2021.
//

import UIKit

@IBDesignable
class DefaultButton: UIButton {
    
    private let activityIndicator = UIActivityIndicatorView()
    
    var isLoading: Bool = false {
        didSet {
            isEnabled = !isLoading
            handleLoadingState()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .highlighted)
        setTitleColor(.white, for: .selected)
        layer.cornerRadius = frame.height / 2
        backgroundColor = .azure
        
        setupIndicator()
    }
    
    private func setupIndicator() {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func handleLoadingState() {
        if isLoading {
            activityIndicator.startAnimating()
            setTitleColor(.clear, for: .normal)
        } else {
            activityIndicator.stopAnimating()
            setTitleColor(.white, for: .normal)
        }
    }
}
