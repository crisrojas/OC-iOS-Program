//
//  MockTranslateRepositoryOutput.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

@testable import Baluchon

class MockTranslateRepositoryOutput: TranslationRepositoryOutput {
    
    var model: Result<TranslationResponse, Error>?
    var states: [TranslationViewState] = []
    
    func didFetchTranslation(result: Result<TranslationResponse, Error>) {
            model = result
        switch result {
        case .success:
            states.append(.success(Translation(translatedText: "", detectedSourceLanguage: "")))
        case .failure:
            states.append(.error("error"))
        }
    }
    
    /// @toDo
    func didUpdate(state: TranslationViewState) {
        states.append(state)
    }
}
