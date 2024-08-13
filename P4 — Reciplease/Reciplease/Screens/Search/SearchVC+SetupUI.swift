//
//  SearchVC+SetupUI.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 28/03/2021.
//

import UIKit

extension SearchViewController {
    
    func setupUI() {
        
        setupCollectionView()
        
        subHeadingLabel.text = S.searchSubHeading
        subHeadingLabel.font = .textMedium
        subHeadingLabel.textColor = .darkPurple
        
        ingredientsLabel.text = S.searchIngredientList
        ingredientsLabel.font = .textBig
        ingredientsLabel.textColor = .darkPurple
        
        clearButton.imageEdgeInsets = UIEdgeInsets.same(with: 18)
        clearButton.backgroundColor = .pink
        clearButton.tintColor = .blood
        clearButton.layer.cornerRadius = 52 / 2
        clearButton.layer.masksToBounds = true
        
        
        searchBarView.backgroundColor = .darkerCream
        searchBarView.layer.cornerRadius = 26
        
        
        appendButton.layer.cornerRadius = 22
        appendButton.layer.masksToBounds = true
        searchTextField.delegate = self
        searchTextField.font = UIFont.textMedium
        searchTextField.textColor = .darkPurple
        searchTextField.attributedPlaceholder = NSAttributedString(
            string: S.searchPlaceholder,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.paleBrown,
                NSAttributedString.Key.font: UIFont.textSmall
            ])
        
        searchButton.setTitle(S.search, for: .normal)
        
        setupNavbar()
        setupIngredientsSection()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let layout = TagFlowLayout()
        layout.estimatedItemSize = CGSize(width: 140, height: 40)
        collectionView.collectionViewLayout = layout
    }
    
    private func setupNavbar() {

        navigationItem.title = S.searchHeading
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Clears shadow
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor.cream50
        navigationController?.navigationBar.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.darkPurple,
             NSAttributedString.Key.font: UIFont.textBiggest]
    }
    
    func setupIngredientsSection() {
        if dataSource.isEmpty {
            hideIngredientSection()
        } else {
            showIngredientSection()
        }
    }
    
    private func hideIngredientSection() {
        ingredientsSectionHeader.isHidden = true
        collectionView.isHidden = true
        searchButton.isHidden = true
        clearButton.isHidden = true
    }
    
    private func showIngredientSection() {
        ingredientsSectionHeader.isHidden = false
        clearButton.isHidden = false
        collectionView.isHidden = false
        searchButton.isHidden = false
    }
}

extension SearchViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.4) {
            self.searchBarView.backgroundColor = .white
            self.searchBarView.layer.shadowColor = UIColor.black.cgColor
            self.searchBarView.layer.shadowOpacity = 0.2
            self.searchBarView.layer.shadowOffset = .zero
            self.searchBarView.layer.shadowRadius = 2
            
            self.searchTextField.attributedPlaceholder = NSAttributedString(
                string: S.searchPlaceholder,
                attributes: [
                    NSAttributedString.Key.font: UIFont.textMedium
                ])
            
            self.appendButton.backgroundColor = .deepGreen
            self.appendButton.tintColor = .white
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.4) {
            self.searchBarView.backgroundColor = .darkerCream
            self.searchBarView.layer.shadowColor = UIColor.clear.cgColor
            self.searchTextField.attributedPlaceholder = NSAttributedString(
                string: S.searchPlaceholder,
                attributes: [
                    NSAttributedString.Key.font: UIFont.textSmall
                ])
            
            self.appendButton.backgroundColor = .pink
            self.appendButton.tintColor = .blood
        }
        
    }
}
