//
//  MockFixerRepositoryOutput.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//
@testable import Baluchon

class MockFixerRepositoryOutput: ExchangeRepositoryOutput {
    var model: Result<ExchangeResponse, Error>?
    var states: [ExchangeViewState] = [ ]
    func didFetchExchange(result: Result<ExchangeResponse, Error>) {
        model = result
        switch result {
        case .success(let response):
            states.append(.success(response))
        case .failure:
            states.append(.error("error"))
        }
    }
    
    func didUpdate(state: ExchangeViewState) {
        states.append(state)
    }
}
