//
//  Recipe.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 01/05/2021.
//

import Foundation

struct Recipe: Equatable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let ingredients: [String]
    let totalTime: Int
}

extension Recipe: Decodable {
    private enum CodingKeys: String, CodingKey {
        case uri
        case label
        case image
        case source
        case url
        case shareAs
        case yield
        case ingredients
        case totalTime
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        uri = try container.decode(String.self, forKey: .uri)
        url = try container.decode(String.self, forKey: .url)
        label = try container.decode(String.self , forKey: .label)
        image = try container.decode(String.self, forKey: .image)
        source = try container.decode(String.self, forKey: .source)
        shareAs = try container.decode(String.self, forKey: .shareAs)
        yield = try container.decode(Int.self, forKey: .yield)
        totalTime = try container.decode(Int.self, forKey: .totalTime)
        
        let tmpIngredients = try container.decode([Ingredient].self, forKey: .ingredients)
        ingredients = tmpIngredients.map { $0.text }
        
    }
}
