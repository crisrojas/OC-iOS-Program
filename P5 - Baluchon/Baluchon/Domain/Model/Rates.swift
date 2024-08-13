//
//  Rates.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/01/2021.
//
// MARK: - Rates
struct Rates: Decodable, Equatable {
    let usd: Float

    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
}
