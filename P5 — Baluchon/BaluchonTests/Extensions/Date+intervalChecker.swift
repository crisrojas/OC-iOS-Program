//
//  Date+intervalChecker.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 07/03/2021.
//

import XCTest
@testable import Baluchon

class DateTests: XCTestCase {
    
    func testIntervalShouldBeGreather() {
        var dateComponents = DateComponents()
        
        dateComponents.year = 2021
        dateComponents.month = 3
        dateComponents.day = 7
        
        let calendar = Calendar(identifier: .gregorian)
        
        let firstDate = calendar.date(from: dateComponents)
        
        /// Create seconde date: two days after first date
        dateComponents.day = 9
        let secondDate = calendar.date(from: dateComponents)
        
        if secondDate!.moreThanADay(from: firstDate!) {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testIntervalShouldBeZero() {
        var dateComponents = DateComponents()
        
        dateComponents.year = 2021
        dateComponents.month = 3
        dateComponents.day = 7
        
        let calendar = Calendar(identifier: .gregorian)
        
        let firstDate = calendar.date(from: dateComponents)
        
        dateComponents.day = 7
        let secondDate = calendar.date(from: dateComponents)
        
        let interval = secondDate!.timeIntervalSince(firstDate!)
        if interval == 0 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    func testIntervalShouldBe_3600() {
        var dateComponents = DateComponents()
        
        dateComponents.year = 2021
        dateComponents.month = 3
        dateComponents.day = 7
        dateComponents.hour = 14
        
        let calendar = Calendar(identifier: .gregorian)
        
        let firstDate = calendar.date(from: dateComponents)
        
        /// Create seconde date: firstDate + 1 hour
        dateComponents.hour! += 1
        let secondDate = calendar.date(from: dateComponents)
        
        let interval = secondDate!.timeIntervalSince(firstDate!)
        
        /// 3600s = 1 hour
        if interval == 3600 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }
    
    
    func testIntervalShouldBeLesser() {
        var dateComponents = DateComponents()
        
        dateComponents.year = 2021
        dateComponents.month = 3
        dateComponents.day = 7
        dateComponents.hour = 15
        
        let calendar = Calendar(identifier: .gregorian)
        
        let firstDate = calendar.date(from: dateComponents)
        
        dateComponents.day = 7
        dateComponents.hour = 16
        let secondDate = calendar.date(from: dateComponents)
        
        if secondDate!.moreThanADay(from: firstDate!) {
            XCTAssert(false)
        } else {
            XCTAssert(true)
        }
    }
}
