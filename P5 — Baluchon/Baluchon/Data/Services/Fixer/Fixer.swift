//
//  Fixer.swift
//  Baluchon
//
//  Created by Cristian Rojas on 19/11/2020.
//

import Foundation

enum Fixer {
    static let apiKey  = "115efb3724993372af3e8e008bd5e21d"
    static let baseURL = "http://data.fixer.io/api/latest"

    case eurUSD
    case usdEUR
}

// MARK: - Router
extension Fixer {
    
    var url: URL? {
        switch self {
        case .eurUSD:
            return buildURL(from: "EUR", to: "USD")
        case .usdEUR:
            return buildURL(from: "USD", to: "EUR")
        }
    }
    
    private func buildURL(from: String, to: String) -> URL? {
        var components = URLComponents(string: Fixer.baseURL)!
        
        let queryItemToken = URLQueryItem(name: "access_key", value: Fixer.apiKey)
        let queryItemFrom = URLQueryItem(name: "base", value: from)
        let queryItemTo = URLQueryItem(name: "symbols", value: to)
        
        components.queryItems = [queryItemToken,
                                 queryItemFrom,
                                 queryItemTo]
        return components.url
    }
}
