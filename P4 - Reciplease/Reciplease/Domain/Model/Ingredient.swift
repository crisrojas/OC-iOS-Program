//
//  Ingredient.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import Foundation


// MARK: - Ingredient
struct Ingredient: Equatable, Codable {
    let text: String

    enum CodingKeys: String, CodingKey {
        case text
    }
}
