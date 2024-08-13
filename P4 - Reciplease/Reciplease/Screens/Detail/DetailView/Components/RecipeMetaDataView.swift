//
//  RecipeMetaDataView.swift
//  Reciplease
//
//  Created by Cristian Rojas on 30/05/2021.
//

import UIKit

class RecipeMetaDataView: UIStackView {
    
    private lazy var timeView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .textSmall
        return view
    }()
    
    private lazy var yieldView: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = .textSmall
        return view
    }()
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .paleBrown50
        layer.cornerRadius = 4
               
        addArrangedSubview(timeView)
        addArrangedSubview(yieldView)
    }
    
    func hideTimeLabel() {
        timeView.isHidden = true
    }
    
    func hideYieldLabel() {
        yieldView.isHidden = true
    }
    
    func setTimeLabel(_ time: Int) {
        timeView.text = "⏱" + " " + "\(time)"
    }
    
    func setYieldLabel(_ yield: Int) {
        yieldView.text = "👍" + " " + "\(yield)"
    }
}
