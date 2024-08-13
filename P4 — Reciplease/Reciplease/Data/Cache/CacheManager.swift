//
//  CacheManager.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 23/04/2021.
//

import Foundation

struct CacheManager {
    var recipeImages: [String: Data] = [:]
    
    mutating func clearCache() {
        recipeImages = [:]
    }
}

var cacheManager = CacheManager()
