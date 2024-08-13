//
//  Loader.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 27/03/2021.
//

import UIKit

@IBDesignable
class FoodActivityIndicator: UIView {
    
    private let emojiLabel = UILabel()
    private var timer: Timer?
    private var index = 0
    
    var hidesWhenStopped: Bool = true
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        
        backgroundColor = .clear
        
        setupLabel()
    }
    
    private func setupLabel() {
        addSubview(emojiLabel)
        emojiLabel.font = emojiLabel.font.withSize(24)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emojiLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            emojiLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        ])
    }
    
    func startAnimating() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
        if hidesWhenStopped { self.isHidden = false }
    }
    
    func startRotating() {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = -Double.pi * 2
        rotateAnimation.duration = 1.0
        rotateAnimation.repeatCount = .infinity
        
        emojiLabel.layer.add(rotateAnimation, forKey: nil)
    }
    
    func stopAnimating() {
        timer?.invalidate()
        if hidesWhenStopped { self.isHidden = true }
    }

    @objc
    func fireTimer() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if let emoji = FoodEmojis.allCases.getOrNull(at: self.index) {
                self.index += 1
                self.emojiLabel.text = emoji.rawValue
            } else {
                self.index = 0
                self.emojiLabel.text = FoodEmojis.allCases[self.index].rawValue
            }
        }
    }
}
