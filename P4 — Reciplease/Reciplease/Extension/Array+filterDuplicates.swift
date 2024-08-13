//
//  Array+filterDuplicates.swift
//  Reciplease
//
//  Created by Cristian Rojas on 29/05/2021.
//

import Foundation

extension Array where Element: Equatable {
    func filterDuplicates() -> [Element] {
        var newArray = [Element]()
        for item in self {
            if newArray.firstIndex(of: item) == nil {
                newArray.append(item)
            }
        }
        return newArray
    }
}
