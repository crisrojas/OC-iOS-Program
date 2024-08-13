//
//  TagCollectionViewCell.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 04/04/2021.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet var tagLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        
        // MARK: - Background
        layer.cornerRadius = 20
        layer.masksToBounds = true
        backgroundColor = .brightSalmon
        
        // MARK: - Label
        tagLabel.font = .textSmall
        tagLabel.textColor = .blood
    }
}
