//
//  FixerApiTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

import XCTest
@testable import Baluchon

class FixerTests: XCTestCase {
    
    let baseURL = "http://data.fixer.io/api/latest?access_key=115efb3724993372af3e8e008bd5e21d&base="
    
    func testFixerRouter_eurUSD_case() {
        let expectedStr = baseURL + "EUR&symbols=USD"
        assertThatURL(from: expectedStr, is: Fixer.eurUSD.url)
    }
    
    func testFixerRouter_usdEur_case() {
        let expectedStr = baseURL + "USD&symbols=EUR"
        assertThatURL(from: expectedStr, is: Fixer.usdEUR.url)
    }
}

private extension FixerTests {
    func assertThatURL(from expectedStr: String, is modelStr: URL?, line: UInt = #line) {
        guard let expectedURL = URL(string: expectedStr) else {
            XCTFail("Unable to build url from str")
            return
        }
        
        guard let caseURL = modelStr else {
            XCTFail("Unable to build url on the model")
            return
        }
        XCTAssertEqual(caseURL, expectedURL, line: line)
    }
}
