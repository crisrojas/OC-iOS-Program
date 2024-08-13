//
//  WeatherDidFetch.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import UIKit

extension WeatherViewController {
    func didFetchLocalWeather(result: Result<WeatherResponse, Error>) {
        switch result {
        case .success(let response):
            didUpdateLocal(state: .successLocal(response))
        case .failure(let error):
            didUpdateLocal(state: .errorLocal(error.type.message))
        }
    }
    
    func didFetchDestinationWeather(result: Result<WeatherResponse, Error>) {
        switch result {
        case .success(let response):
            didUpdateDestination(state: .successDestination(response))
        case .failure(let error):
            didUpdateDestination(state: .errorDestination(error.type.message))
        }
    }
}
