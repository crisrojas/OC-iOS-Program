//
//  RecipesRepositoryTests.swift
//  RecipleaseTests
//
//  Created by Cristian Felipe Patiño Rojas on 05/04/2021.
//

import XCTest
@testable import Reciplease

class RecipesRepositoryTests: XCTestCase {
    
    /// SUT dependences
    var api: MockRecipeApi!
    var output: MockRecipesRepositoryOutput!
    
    /// SUT protocol
    var sut: RecipesRepositoryInput!

    override func setUp() {
        
        /// SUT Dependencies
        api = MockRecipeApi()
        output = MockRecipesRepositoryOutput()
        
        /// SUT  object
        sut = RecipesRepository(api: api)
        sut.output = output
    }

    override func tearDown() {
        api = nil
        output = nil
        sut = nil
    }
    
    func testPerformResearch_WithSuccess() {
        sut.performSearch(query: "")
        if case .success = output.result {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    func testPerformSearch_WithFailure() {
        api.withError = true
        sut.performSearch(query: "")
        if case .failure = output.result {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testPerformResearch_WithSuccess_SetsSuccessState() {
        sut.performSearch(query: "test")
        XCTAssertEqual(output.states.count, 2)
        XCTAssertEqual(output.states.last, .success(MockRecipeApi.mockResponse))
    }
    
    func testPerformResearch_WithFailure_SetsErrorState() {
        api.withError = true
        sut.performSearch(query: "")
        XCTAssertEqual(output.states.count, 2)
        XCTAssertEqual(output.states.last, .error)
    }
}
