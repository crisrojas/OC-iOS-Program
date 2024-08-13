//
//  MockTranslateApi.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

@testable import Baluchon

class MockTranslateApi: GoogleTranslateApiInput {

    var response: TranslationResponse!
    var withError: Bool
    init(withError: Bool = false) {
        self.withError = withError
    }
    
    func getTranslation(query: String, completion: @escaping ((Result<TranslationResponse, Error>) -> Void)) {
        if withError {
            completion(.failure(Error(type: .noDataError)))
        }  else {
            completion(.success(response))
        }
    }
}
