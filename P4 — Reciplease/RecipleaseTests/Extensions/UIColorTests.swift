//
//  UIColor.swift
//  RecipleaseTests
//
//  Created by Cristian Felipe Patiño Rojas on 27/03/2021.
//

import XCTest
@testable import Reciplease

class UIColorTests: XCTestCase {
    
    func testColors() {
        XCTAssertNotEqual(UIColor.salmon, nil)
        XCTAssertNotEqual(UIColor.cream, nil)
        XCTAssertNotEqual(UIColor.darkPurple, nil)
    }
}
