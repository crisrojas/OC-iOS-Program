//
//  SearchVC+CollectionView.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 04/04/2021.
//

import UIKit

extension SearchViewController:
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as? TagCollectionViewCell
        else {
            return TagCollectionViewCell()
        }
        
        
        if let value = FoodEmojis.model[dataSource[indexPath.row]] {
            cell.tagLabel.text = value + " " + dataSource[indexPath.row]
        } else {
            cell.tagLabel.text = dataSource[indexPath.row]
        }
       
        cell.tagLabel.preferredMaxLayoutWidth = collectionView.frame.width - 32
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        dataSource.remove(at: indexPath.item)
        collectionView.reloadData()
        
    }
}
