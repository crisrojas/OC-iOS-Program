//
//  ReponseMappingTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 20/02/2021.
//

import XCTest
@testable import Baluchon

class ReponseMappingTests: XCTestCase {
    
    func testMapResponse() {
        guard let weather = decodeJsonFile(filename: "WeatherResponse", decodable: true) else { return }
     
        XCTAssertEqual(weather.name, "Chartres")
    }
    
    func testMapResponseWithError() {
        let weather = decodeJsonFile(filename: "UndecodableResponse", decodable: false)
        XCTAssertEqual(weather, nil)
    }
    
    private func decodeJsonFile(filename: String, decodable: Bool) -> WeatherResponse? {
        let bundle = Bundle(for: type(of: self))
        
        guard let url = bundle.url(forResource: filename, withExtension: "json") else {
            XCTFail("Missing file: \(filename).json")
            return nil
        }
        
        let json = try? Data(contentsOf: url)
        
        guard let weather = json?.mapResponse(into: WeatherResponse.self) else { return nil }
        return weather
    }
}
