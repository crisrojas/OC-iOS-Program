//
//  Array+getOrNull.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 05/04/2021.
//

import Foundation

extension Array {
    
    func getOrNull(at index: Int) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
