//
//  DefaultButton.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import UIKit

class DefaultButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = .pink
        titleLabel?.font = .textMedium
        titleLabel?.textColor = .blood
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
    }
}
