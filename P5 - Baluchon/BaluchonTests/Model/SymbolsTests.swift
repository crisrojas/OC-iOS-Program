//
//  SymbolsTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 20/02/2021.
//

import XCTest
@testable import Baluchon

class SymbolsTests: XCTestCase {

    func testSymbols() {
        XCTAssertEqual(Symbols.eur.string,"€")
        XCTAssertEqual(Symbols.usd.string, "$")
    }

}
