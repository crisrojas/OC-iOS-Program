//
//  UIColorTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 06/02/2021.
//

import UIKit
import XCTest
@testable import Baluchon

class UIColorTests: XCTestCase {
    
    func testColorArenFound() {
        XCTAssertNotEqual(UIColor.azure, nil)
        XCTAssertNotEqual(UIColor.greyWhite, nil)
        XCTAssertNotEqual(UIColor.lightGrey, nil)
//        XCTAssertNotEqual(UIColor.white, nil)

    }
}
