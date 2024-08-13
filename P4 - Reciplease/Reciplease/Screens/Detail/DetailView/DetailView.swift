//
//  DetailView.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import Alamofire
import CoreData
import UIKit

class DetailView: UIView {
    
    lazy var picture: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cream
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.font = .textBiggest
        view.numberOfLines = 0
        view.textColor = .darkPurple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var favoriteButton: FavoriteButton = {
        let view = FavoriteButton()
        view.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var totalTimeView: DetailMetaView = {
        let view = DetailMetaView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ingredientsTableView: UITableView = {
        let view = UITableView()
        view.backgroundView = nil
        view.backgroundColor = .clear
        view.tableFooterView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var ingredientsLabel: UILabel = {
        let view = UILabel()
        view.font = .textMedium
        view.textColor = .darkPurple
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var getButton: DefaultButton = {
        let view = DefaultButton()
        view.addTarget(self, action: #selector(getButtonPressed), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var informationStackView: RecipeMetaDataView = {
        let view = RecipeMetaDataView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = UIStackView.spacingUseSystem
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return view
    }()
    
    var model: RecipeBO!
    var delegate: DetailViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
}

private extension DetailView {
    
    @objc
    func favoriteButtonPressed() {
        delegate?.didTapFavoriteButton(model)
    }
    
    @objc
    func getButtonPressed() {
        delegate?.didTapGetDirectionButton()
    }
}
