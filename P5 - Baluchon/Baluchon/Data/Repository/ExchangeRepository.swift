//
//  ExchangeRepository.swift
//  Baluchon
//
//  Created by cris on 19/12/2020.
//

import Foundation

protocol ExchangeRepositoryOutput: class {
    func didFetchExchange(result: Result<ExchangeResponse, Error>)
    func didUpdate(state: ExchangeViewState)
}

protocol ExchangeRepositoryInput {
    func fetchExchange()
    var output: ExchangeRepositoryOutput? { get set }
}

class ExchangeRepository: ExchangeRepositoryInput {
    
    weak var output: ExchangeRepositoryOutput?
    private let api: FixerApiInput
    
    init(api: FixerApiInput) {
        self.api = api
    }
    
    func fetchExchange() {
        output?.didUpdate(state: .loading)
        api.getRate { [weak self] result in
            self?.output?.didFetchExchange(result: result)
        }
    }
}
