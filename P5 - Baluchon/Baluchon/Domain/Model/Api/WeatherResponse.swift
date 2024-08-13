//
//  WeatherResponse.swift
//  Baluchon
//
//  Created by cris on 18/12/2020.
//

import Foundation

struct WeatherResponse: Decodable, Equatable {
    let name: String
    let main: WeatherTemp
    let weather: [Weather]
}
