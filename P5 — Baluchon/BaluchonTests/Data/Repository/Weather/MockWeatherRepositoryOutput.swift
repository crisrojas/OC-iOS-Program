//
//  MockWeatherRepositoryOutput.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 14/01/2021.
//

import Foundation
@testable import Baluchon

class MockWeatherRepositoryOutput: WeatherRepositoryOutput {
    
    var localStates: [WeatherViewState] = [ ]
    var destinationStates: [WeatherViewState] = [ ]
    var local: Result<WeatherResponse, Error>?
    var destination: Result<WeatherResponse, Error>?
    
    func didFetchLocalWeather(result: Result<WeatherResponse, Error>) {
        local = result
        switch result {
        case .success(let success):
            localStates.append(.successLocal(success))
        case .failure:
            localStates.append(.errorLocal("error"))
        }
    }
    
    func didFetchDestinationWeather(result: Result<WeatherResponse, Error>) {
        destination = result
        switch result {
        case .success(let success):
            destinationStates.append(.successDestination(success))
        case .failure:
            destinationStates.append(.errorDestination("error"))
        }
    }
    
    func didUpdateDestination(state: WeatherViewState) {
       destinationStates.append(state)
    }
    
    func didUpdateLocal(state: WeatherViewState) {
        localStates.append(state)
    }
}
