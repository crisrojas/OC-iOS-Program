//
//  FixerRepositoryTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

import XCTest
@testable import Baluchon

class FixerRepositoryTest: XCTestCase {
    
    var sut: ExchangeRepositoryInput!
    var output: MockFixerRepositoryOutput!
    var api: MockFixerApi!
    
    let expectedResponse = ExchangeResponse(rates: Rates(usd: 20.5))
    
    override func setUp() {
        output = MockFixerRepositoryOutput()
        api = MockFixerApi()
        sut = ExchangeRepository(api: api)
        sut.output = output
        
        api.response = expectedResponse
    }
    
    override func tearDown() {}
    
    func testFetchExchangeWithSuccess() {
        sut.fetchExchange()
        if case .success = output.model {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchExchangeWithError() {
        api.withError = true
        sut.fetchExchange()
        if case .failure = output.model {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchingChangesStateSuccess() {
        sut.fetchExchange()
        XCTAssertEqual(output.states.count, 2)
        XCTAssertEqual(output.states.last, .success(expectedResponse))
    }
    
    func testFetchingChangesStateFailureCase() {
        api.withError = true
        sut.fetchExchange()
        XCTAssertEqual(output.states.count, 2)
        XCTAssertEqual(output.states.last, .error("error"))
    }
}
