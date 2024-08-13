//
//  WeatherVCTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 10/01/2021.
//

import XCTest
@testable import Baluchon


@available(iOS 13.0, *)
class WeatherVCTests: XCTestCase {
    
    var sut: WeatherViewController!
    var repository: WeatherRepositoryInput!
    
    override func setUp() {
        repository = WeatherRepository(api: MockWeatherApi())
        sut = WeatherViewController()
//        sut.repository = repository
    }
    
    override func tearDown() {
        repository = nil
        sut = nil
    }
    
    
    func testGivenIdleState_WhenLoadModel_ThenStateGoesFromIdleSuccess() {
        _ = [
            WeatherViewState.loadingDestination,
            WeatherViewState.successDestination(WeatherResponse(name: "", main: WeatherTemp(temp: 0.0), weather: []))
        ]
    }
    
}



