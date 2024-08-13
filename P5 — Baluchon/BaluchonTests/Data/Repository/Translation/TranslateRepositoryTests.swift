//
//  TranslateRepositoryTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 17/01/2021.
//

import XCTest
@testable import Baluchon

class TranslateRepositoryTests: XCTestCase {
    
    var sut: TranslationRepositoryInput!
    var output: MockTranslateRepositoryOutput!
    var api: MockTranslateApi!
    
    var expectedApiResponse = TranslationResponse(data: TranslationData(translations: []))
    
    override func setUp() {
        output = MockTranslateRepositoryOutput()
        api = MockTranslateApi()
        sut = TranslationRepository(api: api)
        sut.output = output
        
        api.response = expectedApiResponse
    }
    
    func testFetchTranslationWithSuccess() {
        sut.fetchTranslation(query: "tests")
        if case .success = output.model {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchTranslationWithError() {
        api.withError = true
        sut.fetchTranslation(query: "tests")
        if case .failure = output.model {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testFetchingChangesStateSuccess() {
        sut.fetchTranslation(query: "test")
        XCTAssertEqual(output.states.count, 2)
        XCTAssertEqual(output.states.last, .success(Translation(translatedText: "", detectedSourceLanguage: "")))
    }
    
    func testFetchingChangesStatFailure() {
        api.withError = true
        sut.fetchTranslation(query: "test")
        XCTAssertEqual(output.states.count, 2)
        XCTAssertEqual(output.states.last, .error("error"))
    }
}
