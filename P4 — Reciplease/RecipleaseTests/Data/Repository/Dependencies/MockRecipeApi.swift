//
//  MockRecipeApi.swift
//  RecipleaseTests
//
//  Created by Cristian Felipe Patiño Rojas on 22/05/2021.
//

import Foundation
@testable import Reciplease

class MockRecipeApi: RecipleaseApiInput {

    var withError = false
    static let mockResponse: RecipeResponse = RecipeResponse(recipes: [])

    func getSearch(query: String, completion: @escaping (Result<RecipeResponse, Error>) -> Void) {
        if withError {
            completion(.failure(Error(type: .networkError)))
        } else {
            completion(.success(MockRecipeApi.mockResponse))
        }
    }
}
