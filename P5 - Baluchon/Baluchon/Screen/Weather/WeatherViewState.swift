//
//  WeatherViewState.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

enum WeatherViewState: Equatable {
    case loadingLocal
    case successLocal(WeatherResponse)
    case errorLocal(String)
    
    case loadingDestination
    case successDestination(WeatherResponse)
    case errorDestination(String)
}
