//
//  RecipesRepository.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 05/04/2021.
//

import Foundation

enum SearchViewState: Equatable {
    case loading
    case success(RecipeResponse)
    case error
    
    var isLoading: Bool {
        self == .loading
    }
}

protocol RecipesRepositoryInput {
    var output: RecipesRepositoryOutput? { get set }
    func performSearch(query: String)
}

protocol RecipesRepositoryOutput: AnyObject {
    func didPerformSearch(_ result: Result<RecipeResponse, Error>)
    func didUpdate(state: SearchViewState)
}

class RecipesRepository: RecipesRepositoryInput {
    
    weak var output: RecipesRepositoryOutput?
    private var api: RecipleaseApiInput
    
    init(api: RecipleaseApiInput = Api.edamam) {
        self.api = api
    }

    func performSearch(query: String) {
        output?.didUpdate(state: .loading)
        api.getSearch(query: query) { [weak output] result in
            output?.didPerformSearch(result)
        }
    }
}
