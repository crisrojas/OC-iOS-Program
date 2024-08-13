//
//  ErrorView.swift
//  Baluchon
//
//  Created by Cristian Rojas on 23/01/2021.
//

import UIKit

class ErrorView: UIView {
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet weak var retryButton: UIButton!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    @IBAction func retryButtonPressed(_ sender: UIButton) {
    }
    
}
