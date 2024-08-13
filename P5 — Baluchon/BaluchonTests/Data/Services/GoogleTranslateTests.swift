//
//  GoogleTranslateTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

import XCTest
@testable import Baluchon


class GoogleTranslateTest: XCTestCase {
    
    func test_router() {
        assertBuiltUrlIsCorrect(from: "test")
    }
    
    func test_router_with_spaces_in_query() {
        assertBuiltUrlIsCorrect(from: "this is another test")
    }
}

private extension GoogleTranslateTest {
    func assertBuiltUrlIsCorrect(from query: String, line: UInt = #line) {
        guard let sanitazedStr = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            XCTFail("Return value is nil")
            return
        }
        let expectedStr = "https://translation.googleapis.com/language/translate/v2?key=AIzaSyDXyyQsbQ6PWQ_0oPMIQyDX-jEzhU6m9Ks&q=\(sanitazedStr)&target=en"
        let expectedURL = URL(string: expectedStr)
        XCTAssertEqual(expectedURL, GoogleTranslate.translate(query: query).url, line: line)
    }
}
