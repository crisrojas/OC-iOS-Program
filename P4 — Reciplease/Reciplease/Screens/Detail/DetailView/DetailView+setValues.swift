//
//  DetailView+setValues.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import Alamofire
import CoreData
import UIKit

extension DetailView {
    
    func setTableViewController(_ delegateAndDataSource: UITableViewDelegate & UITableViewDataSource) {
        ingredientsTableView.delegate = delegateAndDataSource
        ingredientsTableView.dataSource = delegateAndDataSource
    }
    
    func set(model: RecipeBO) {
        self.model = model
        setPicture(with: model)
        setTitleLabel(model.label)
        setButtonLink(model.shareAs)
        setButtonTitle(S.getDirections)
        setTimeCountLabel(model.totalTime)
        setYieldLabel(model.yield)
        setFavoriteState(model.isFavorite)
    }
    
    func setFavoriteState(_ favorite: Bool) {
        favoriteButton.setState(favorite: favorite)
    }
    
    private func setPicture(with model: RecipeBO) {
        if let cachedData = cacheManager.recipeImages[model.label],
           let image = UIImage(data: cachedData) {
            picture.image = image
        } else {
            setPicture(with: model.image, and: model.label)
        }
    }
    
    private func setPicture(with url: String, and label: String) {
        
        AF.request(url, method: .get).response{ response in
            
            switch response.result {
            case .success(let responseData):
                
                guard
                    let safeData = responseData,
                    let image = UIImage(data: safeData) else
                {
                    return
                }
                
                cacheManager.recipeImages[label] = safeData
                self.picture.image = image
                
            case .failure(let error):
                /// @nth
                print("error--->",error)
            }
        }
    }
    
    private func setButtonLink(_ url: String) { }
    private func setButtonTitle(_ title: String) {
        getButton.setTitle(title, for: .normal)
    }
    
    private func setTitleLabel(_ label: String) {
        titleLabel.text = label
    }
    
    private func setIngredientsLabel(_ label: String) {
        ingredientsLabel.text = label
    }
    
    private func setTimeCountLabel(_ time: Int) {
        informationStackView.setTimeLabel(time)
        if time == 0 {
            informationStackView.hideTimeLabel()
        }
        
    }
    
    private func setYieldLabel(_ yield: Int) {
        informationStackView.setYieldLabel(yield)
        if yield == 0 {
            informationStackView.hideYieldLabel()
        }
    }
}
