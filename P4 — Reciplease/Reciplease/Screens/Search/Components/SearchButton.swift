//
//  SearchButton.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 04/04/2021.
//

import UIKit

@IBDesignable
class SearchButton: UIButton {
    
    private var activityIndicator = FoodActivityIndicator()
    
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
    
    private func handleLoadingState() {
        if isLoading {
            activityIndicator.startAnimating()
            clearIcon()
            setTitleColor(.clear, for: .normal)
        } else {
            activityIndicator.stopAnimating()
            setupIcon()
            setTitleColor(.white, for: .normal)
        }
    }
    
    private func setupButton() {

        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .highlighted)
        setTitleColor(.white, for: .selected)
        layer.cornerRadius = frame.height / 2
        titleLabel?.font = .textMedium
        backgroundColor = .strongSalmon
        
        setupIcon()
        setupIndicator()
    }
    
    private func setupIndicator() {
        activityIndicator.hidesWhenStopped = true
        addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            activityIndicator.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func setupIcon() {
        let icon = UIImage(named: "icSearchButton")!.withRenderingMode(.alwaysOriginal)
        setImage(icon, for: .normal)
        imageView?.contentMode = .scaleAspectFit
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)

    }
    
    private func clearIcon() {
        let icon = UIImage()
        setImage(icon, for: .normal)
    }
}
