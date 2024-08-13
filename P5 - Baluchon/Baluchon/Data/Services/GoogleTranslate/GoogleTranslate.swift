//
//  GoogleTranslate.swift
//  Baluchon
//
//  Created by Cristian Rojas on 19/11/2020.
//

import Foundation

enum GoogleTranslate {
    
    static let apiKey  = ""
    static let baseURL = "https://translation.googleapis.com/language/translate/v2"
    
    case translate(query: String)
}


// MARK: - Router
extension GoogleTranslate {
    
    var url: URL? {
        switch self {
        case .translate(let query):
            return buildURL(query: query)
        }
    }
    
    func buildURL(query: String) -> URL? {
        var components = URLComponents(string: GoogleTranslate.baseURL)!
        
        let queryItemToken  = URLQueryItem(name: "key", value: GoogleTranslate.apiKey)
        let queryItemQuery  = URLQueryItem(name: "q", value: query)
        let queryItemTarget = URLQueryItem(name: "target", value: "en")
        
        components.queryItems = [queryItemToken,
                                 queryItemQuery,
                                 queryItemTarget]
        return components.url
    }
}
