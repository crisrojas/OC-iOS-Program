//
//  MockWeatherApi.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 14/01/2021.
//

import Foundation
@testable import Baluchon

class MockWeatherApi: OpenWeatherApiInput {
    
    var localResponse: WeatherResponse!
    var destinationResponse: WeatherResponse!
    
    var withError: Bool
    
    init(withError: Bool = false) {
        self.withError = withError
    }
    
    func getLocalWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        if withError {
            completion(.failure(Error(type: .noDataError)))
        } else {
            completion(.success(localResponse))
        }
    }
    
    func getDestinationWeather(completion: @escaping (Result<WeatherResponse, Error>) -> Void) {
        
        if withError {
            completion(.failure(Error(type: .noDataError)))
        } else {
            completion(.success(destinationResponse))
        }
    }
    
}
