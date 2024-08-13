//
//  FixerApi.swift
//  Baluchon
//
//  Created by cris on 19/12/2020.
//

import Foundation

protocol FixerApiInput {
    func getRate(completion: @escaping ((Result<ExchangeResponse, Error>) -> Void))
}

class FixerApi: FixerApiInput {
    
    func getRate(completion: @escaping ((Result<ExchangeResponse, Error>) -> Void)) {
        URLSession.decode(url: Fixer.eurUSD.url, into: ExchangeResponse.self, with: completion)
    }
}
