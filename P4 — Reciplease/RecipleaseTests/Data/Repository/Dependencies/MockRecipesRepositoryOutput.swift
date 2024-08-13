//
//  MockRecipesRepositoryOutput.swift
//  RecipleaseTests
//
//  Created by Cristian Felipe Patiño Rojas on 22/05/2021.
//

import Foundation
@testable import Reciplease

class MockRecipesRepositoryOutput: RecipesRepositoryOutput {
    var result: Result<RecipeResponse, Error>?
    var states: [SearchViewState] = []

    func didUpdate(state: SearchViewState) {
        states.append(state)
    }

    func didPerformSearch(_ result: Result<RecipeResponse, Error>) {
        self.result = result
        switch result {
        case .success(let response):
            didUpdate(state: .success(response))
        case .failure(_):
            didUpdate(state: .error)
        }
    }
}
