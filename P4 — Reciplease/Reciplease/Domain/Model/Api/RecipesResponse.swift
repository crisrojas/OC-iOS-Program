//
//  RecipesResponse.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 05/04/2021.
//

import CoreData
import Foundation

struct RecipeResponse: Equatable {
    let recipes: [Recipe]
}

extension RecipeResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case hits
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let hits = try container.decode([Hit].self, forKey: .hits)
        recipes = hits.map { $0.recipe }
    }
}
