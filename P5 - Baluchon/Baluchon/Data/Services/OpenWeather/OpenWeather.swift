//
//  OpenWeathermap.swift
//  Baluchon
//
//  Created by Cristian Rojas on 19/11/2020.
//

import Foundation

// MARK: - OpenWeatherMap Service
enum OpenWeather {
    static let apiKey  = ""
    static let baseURL = "https://api.openweathermap.org/data/2.5/weather"
    
    case newYork
    case chartres
}

// MARK: - Router
extension OpenWeather {
    
    var url: URL? {
        switch self {
        case .newYork:
            return buildURL(with: "new+york")
        case .chartres:
            return buildURL(with: "chartres")
        }
    }
    
    private func buildURL(with city: String) -> URL? {
        var components = URLComponents(string: OpenWeather.baseURL)!

        let queryItemQuery = URLQueryItem(name: "q", value: city)
        let queryItemToken = URLQueryItem(name: "appid", value: OpenWeather.apiKey)
        let queryItemMode  = URLQueryItem(name: "mode", value: "json")
        let queryItemUnits = URLQueryItem(name: "units", value: "metric")
        let queryItemsLang = URLQueryItem(name: "lang", value: "fr")

        components.queryItems = [queryItemQuery,
                                 queryItemToken,
                                 queryItemMode,
                                 queryItemUnits,
                                 queryItemsLang]
        return components.url
    }
}
