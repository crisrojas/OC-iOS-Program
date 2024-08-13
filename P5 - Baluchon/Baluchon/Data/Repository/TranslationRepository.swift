//
//  TranslationRepository.swift
//  Baluchon
//
//  Created by cris on 19/12/2020.
//

import Foundation

protocol TranslationRepositoryOutput: class {
    func didFetchTranslation(result: Result<TranslationResponse, Error>)
    func didUpdate(state: TranslationViewState)
}

protocol TranslationRepositoryInput {
    func fetchTranslation(query: String)
    var output: TranslationRepositoryOutput? { get set }
}

class TranslationRepository: TranslationRepositoryInput {
    
    weak var output: TranslationRepositoryOutput?
    var api: GoogleTranslateApiInput?
    
    init(api: GoogleTranslateApiInput) {
        self.api = api
    }
    
    func fetchTranslation(query: String) {
        output?.didUpdate(state: .loading)
        api?.getTranslation(query: query) { [weak self] result in
            self?.output?.didFetchTranslation(result: result)
        }
    }
}
