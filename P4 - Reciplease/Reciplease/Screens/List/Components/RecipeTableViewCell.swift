//
//  RecipeCell.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 16/04/2021.
//

import Alamofire
import UIKit


class RecipeTableViewCell: UITableViewCell {
    
    static let identifier: String = "RecipeCell"
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeCountLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeView: UIView!
    
    override func layoutSubviews() {
        setupUI()
    }
    
    
    func configure(model: RecipeBO) {
        
        titleLabel.text = model.label
        timeLabel.text = "\(model.totalTime) MIN"
        likeCountLabel.text? = "👍 \(model.yield)"
       
        if model.totalTime == 0 {
            timeView.isHidden = true
        }
        
    }
    
    func set(image: UIImage) {
        picture.image = image
    }
    
    func setImage(with url: String, and label: String) {
        
        AF.request(url, method: .get).response { [weak self] response in
            guard let self = self else { return }
            switch response.result {
            case .success(let responseData):
    
                guard
                    let safeData = responseData,
                    let safeImage = UIImage(data: safeData)
                else {
                    self.set(image: UIImage(named: "recipe-placeholder")!)
                    return
                }
                
                cacheManager.recipeImages[label] = safeData
                self.set(image: safeImage)
               
                
            case .failure(let error):
                self.set(image: UIImage(named: "recipe-placeholder")!)
                #if DEBUG
                print(error)
                #endif
            }
        }
    }
    
    private func setupUI() {
        
        layer.cornerRadius = 28
        layer.masksToBounds = true
        backgroundColor = .brightSalmon
        
        picture.layer.cornerRadius = 28
        picture.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        titleLabel.font = .textBiggest
        likeCountLabel.font = .textMedium
//        timeLabel.font = .textSmall
        
        titleLabel.textColor = .darkPurple
        likeCountLabel.textColor = .darkPurple
        timeLabel.textColor =  .darkPurple
        
        timeView.layer.cornerRadius = 12
    }
    
}
