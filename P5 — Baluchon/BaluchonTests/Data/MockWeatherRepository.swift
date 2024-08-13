//
//  MockRepository.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 10/01/2021.
//

@testable import Baluchon

class MockWeatherRepository: WeatherRepositoryInput {
    
    var output: WeatherRepositoryOutput?
    var api: OpenWeatherApiInput?
    
    var withError: Bool
    
    init(withError: Bool = false,
         api: OpenWeatherApiInput?,
         output: WeatherRepositoryOutput?) {
        self.withError = withError
        self.api = api
        self.output = output
    }
    
    func fetchWeather() {}
    
    func fetchDestinationWeather() {
        api?.getDestinationWeather { [weak self] result in
            self?.output?.didFetchDestinationWeather(result: result)
        }
    }
    
    func fetchLocalWeather() {
        api?.getLocalWeather { [weak self] result in
            self?.output?.didFetchLocalWeather(result: result)
        }
    }
}
