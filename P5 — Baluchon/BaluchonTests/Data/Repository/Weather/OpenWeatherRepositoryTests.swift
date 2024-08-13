//
//  WeatherResponseTest.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 10/01/2021.
//

import XCTest
@testable import Baluchon

class OpenWeatherRepositoryTests: XCTestCase {
    
    var output: MockWeatherRepositoryOutput!
    var api: MockWeatherApi!
    var sut: WeatherRepository!
    
    
    static var expectedLocalResponse = WeatherResponse(name: "Chartres", main: WeatherTemp(temp: 20), weather: [])
    static var expectedDestinationResponse = WeatherResponse(name: "NewYork", main: WeatherTemp(temp: 20), weather: [])
    
    override func setUp() {
        
        output = MockWeatherRepositoryOutput()
        api = MockWeatherApi()
        
        api.localResponse = OpenWeatherRepositoryTests.expectedLocalResponse
        api.destinationResponse = OpenWeatherRepositoryTests.expectedDestinationResponse
        
        sut = WeatherRepository(api: api)
        sut.output = output
        
    }
    
    override func tearDown() {
        api = nil
        output = nil
        sut = nil
    }
    
    func testFetchLocalWeatherWithSuccess() {
        
        sut.fetchLocalWeather()
        if case .success = output.local {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchLocalWeatherWithError() {
        api.withError = true
        sut.fetchLocalWeather()
        if case .failure = output.local {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchDestinatioinWeatherWithSuccess() {
        sut.fetchDestinationWeather()
        if case .success = output.destination {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchDestinationlWeatherWithError() {
        api.withError = true
        sut.fetchDestinationWeather()
        if case .failure = output.destination {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchingLocalChangesStateSuccess() {
        sut.fetchLocalWeather()
        XCTAssertEqual(output.localStates.count, 2)
        XCTAssertEqual(output.localStates.last, .successLocal(OpenWeatherRepositoryTests.expectedLocalResponse))
        
       
    }
    
    func testFetchingLocalnChangesStateFailure() {
        /// With error
        api.withError = true
        sut.fetchLocalWeather()
        XCTAssertEqual(output.localStates.count, 2)
        XCTAssertEqual(output.localStates.last, .errorLocal("error"))
    }
    
    func testFetchingDestinationChangesStateSuccess() {
        sut.fetchDestinationWeather()
        XCTAssertEqual(output.destinationStates.count, 2)
        XCTAssertEqual(output.destinationStates.last, .successDestination(OpenWeatherRepositoryTests.expectedDestinationResponse))
    }
    
    func testFetchingDestinationChangesStateFailure() {
        api.withError = true
        sut.fetchDestinationWeather()
        XCTAssertEqual(output.destinationStates.count, 2)
        XCTAssertEqual(output.destinationStates.last, .errorDestination("error"))
    }
}
