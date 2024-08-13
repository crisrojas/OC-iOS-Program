//
//  RecipeBO.swift
//  Reciplease
//
//  Created by Cristian Rojas on 01/05/2021.
//

import Foundation

struct RecipeBO {
    
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let ingredients: [String]
    let totalTime: Int
    
    let isFavorite: Bool
    
    init(recipe: Recipe, isFavorite: Bool) {
        uri = recipe.uri
        label = recipe.label
        image = recipe.image
        source = recipe.source
        url = recipe.url
        shareAs = recipe.shareAs
        yield = recipe.yield
        ingredients = recipe.ingredients
        totalTime = recipe.totalTime
        
        self.isFavorite = isFavorite
    }
    
    init(recipe: RecipeCD) {
        uri = recipe.uri ?? "Empty string"
        label = recipe.label ?? "Empty string"
        image = recipe.image ?? "Empty string"
        source = recipe.source ?? "Empty string"
        url = recipe.url ?? ""
        shareAs = recipe.shareAs ?? "Empty string"
        yield = Int(recipe.yield)
        ingredients = recipe.ingredients ?? [ ]
        totalTime = Int(recipe.totalTime)
        
        
        isFavorite = true
    }
}
