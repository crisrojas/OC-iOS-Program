//
//  WeatherApiTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

import XCTest
@testable import Baluchon

class OpenWeatherTests: XCTestCase {
    
    func test_router_for_destination_url() {
        let expectedUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=new+york&appid=7dc5b6fd66531161e7b9bf05cdc2a680&mode=json&units=metric&lang=fr")
        XCTAssertEqual(expectedUrl, OpenWeather.newYork.url)
    }
    
    func test_router_for_local_url() {
        let expectedUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=chartres&appid=7dc5b6fd66531161e7b9bf05cdc2a680&mode=json&units=metric&lang=fr")
        XCTAssertEqual(expectedUrl, OpenWeather.chartres.url)
    }
}
