//
//  WeatherRepository.swift
//  Baluchon
//
//  Created by cris on 17/12/2020.
//

import Foundation

//typealias WeatherViewState = WeatherViewController.State

protocol WeatherRepositoryOutput: class {
    func didFetchLocalWeather(result: Result<WeatherResponse, Error>)
    func didFetchDestinationWeather(result: Result<WeatherResponse, Error>)
    func didUpdateDestination(state: WeatherViewState)
    func didUpdateLocal(state: WeatherViewState)
}

protocol WeatherRepositoryInput {
    func fetchWeather()
    func fetchDestinationWeather()
    func fetchLocalWeather()
    
    var api: OpenWeatherApiInput? { get set }
    var output: WeatherRepositoryOutput? { get set }
}

class WeatherRepository: WeatherRepositoryInput {
    
    weak var output: WeatherRepositoryOutput?
    var api: OpenWeatherApiInput?
    
    init(api: OpenWeatherApiInput) {
        self.api = api
    }
    
    func fetchWeather() {
        fetchLocalWeather()
        fetchDestinationWeather()
    }
    
    func fetchLocalWeather() {
        output?.didUpdateLocal(state: .loadingLocal)
        api?.getLocalWeather { [weak self] result in
            switch result {
            case .success(let response):
                self?.output?.didFetchLocalWeather(result: .success(response))
            case .failure(let error):
                self?.output?.didFetchLocalWeather(result: .failure(error))
            }
        }
    }
    
    func fetchDestinationWeather() {
        output?.didUpdateDestination(state: .loadingDestination)
        api?.getDestinationWeather { [weak self] result in
            switch result {
            case .success(let response):
                self?.output?.didFetchDestinationWeather(result: .success(response))
            case .failure(let error):
                self?.output?.didFetchDestinationWeather(result: .failure(error))
            }
        }
    }
    
}
