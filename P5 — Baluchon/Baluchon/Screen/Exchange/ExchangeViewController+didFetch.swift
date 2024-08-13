//
//  ExchangeDidFetch.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import Foundation

extension ExchangeViewController {
    func didFetchExchange(result: Result<ExchangeResponse, Error>) {
        switch result {
        case .success(let response):
            didUpdate(state: .success(response))
        case .failure(let error):
            didUpdate(state: .error(error.type.message))
        }
    }
}
