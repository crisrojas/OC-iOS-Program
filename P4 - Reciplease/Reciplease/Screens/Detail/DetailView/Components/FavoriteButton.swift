//
//  FavoriteButton.swift
//  Reciplease
//
//  Created by Cristian Rojas on 22/05/2021.
//

import UIKit

class FavoriteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private var isFavorite: Bool = false {
        didSet {
            setupState()
        }
    }
    
    func setState(favorite: Bool) {
        isFavorite = favorite
    }
    
    private func setupState() {
        isFavorite ? setFavoriteUI() : setNotFavoriteUI()
    }
    
    func toggle() {
        isFavorite.toggle()
    }
    
    private func setFavoriteUI() {
        setImage(UIImage(named: "icHeartFilled")!, for: .normal)
        tintColor = .red
    }
    
    private func setNotFavoriteUI() {
        setImage(UIImage(named: "icHeart"), for: .normal)
        tintColor = .darkPurple
    }
}
