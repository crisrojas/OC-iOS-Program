//
//  MockFixerApi.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

@testable import Baluchon

class MockFixerApi: FixerApiInput {
    
    var response: ExchangeResponse!
    var withError: Bool
    
    init(withError: Bool = false) {
        self.withError = withError
    }

    func getRate(completion: @escaping ((Result<ExchangeResponse, Error>) -> Void)) {
        if withError {
            completion(.failure(Error(type:.noDataError)))
        } else {
            completion(.success(response))
        }
    }
}
