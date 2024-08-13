//
//  OpenWeatherMapApi.swift
//  Baluchon
//
//  Created by cris on 17/12/2020.
//

import Foundation

protocol OpenWeatherApiInput {
    func getLocalWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void)
    func getDestinationWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void)
}

class OpenWeatherApi: OpenWeatherApiInput {
    
    func getLocalWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        URLSession.decode(url: OpenWeather.chartres.url, into: WeatherResponse.self, with: completion)
    }
    
    func getDestinationWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        URLSession.decode(url: OpenWeather.newYork.url, into: WeatherResponse.self, with: completion)
    }
}
