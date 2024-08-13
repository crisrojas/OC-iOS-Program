//
//  RegistryTests.swift
//  BaluchonTests
//
//  Created by Cristian Rojas on 20/02/2021.
//

import XCTest
@testable import Baluchon

class RegistryTests: XCTestCase {
    
    override func setUp() {
        Registry.clear()
    }
    
    override func tearDown() {
        Registry.clear()
    }
    
    func testRegistry() {
        XCTAssertNotEqual(Registry.defaults, nil)
        XCTAssertEqual(Registry.defaults.bool(forKey: .fetchingDate), false)
    }
    
    func testBeforeAddingAKey_ValueDoesntExists() {
        if (UserDefaults.standard.value(forKey: .fetchingDate) as? Date) != nil {
            XCTFail()
        } else {
            XCTAssert(true)
        }
    }
    
    func testWhenAddingKey_ValueIsnNilAnymore() {
        let currentDate = Date()
        UserDefaults.standard.setValue(currentDate, forKey: .fetchingDate)
    }
    
    func testValueShouldBeNilOnFirstRun() {
        let currentDate = Date()
        
        if (UserDefaults.standard.value(forKey: .fetchingDate) as? Date) != nil {
            XCTFail()
        } else {
            UserDefaults.standard.setValue(currentDate, forKey: .fetchingDate)
        }
        
        XCTAssertEqual(UserDefaults.standard.value(forKey: .fetchingDate) as! Date, currentDate)
    }
    
    func testComparingSameValues() {
        let currentDate = Date()
        UserDefaults.standard.setValue(currentDate, forKey: .fetchingDate)
        
        let userDefaultsDate = UserDefaults.standard.value(forKey: .fetchingDate) as! Date
        
        let interval = userDefaultsDate.timeIntervalSince(currentDate)
        
        if interval == 0.0 {
            XCTAssert(true)
        } else {
            XCTFail()
        }
    }
    
    func testComparingDifferentValues() {
        var dateComponents = DateComponents()
        dateComponents.year = 1982
        dateComponents.month = 7
        dateComponents.day = 21
        
        let calendar = Calendar(identifier: .gregorian)
        
        /// FirstDate
        let firstDate = calendar.date(from: dateComponents)
        
        /// SecondDate
        dateComponents.day = 20
        let secondDate = calendar.date(from: dateComponents)
        
        UserDefaults.standard.setValue(firstDate, forKey: .fetchingDate)
        
        let userDefaultsDate = UserDefaults.standard.value(forKey: .fetchingDate) as! Date
        
        let interval = userDefaultsDate.timeIntervalSince(secondDate!)
        
        let minute: TimeInterval = 60.0
        let hour: TimeInterval = 60.0 * minute
        let day: TimeInterval = 24 * hour
        
        if interval == day {
            XCTAssert(true)
        } else {
            XCTFail()
        }
    }
    
    func testComparingGreatherThanADay() {
        var dateComponents = DateComponents()
        dateComponents.year = 1982
        dateComponents.month = 7
        dateComponents.day = 21
        
        let calendar = Calendar(identifier: .gregorian)
        
        /// FirstDate
        let firstDate = calendar.date(from: dateComponents)
        
        /// SecondDate
        dateComponents.day = 20
        let secondDate = calendar.date(from: dateComponents)
        
        UserDefaults.standard.setValue(firstDate, forKey: .fetchingDate)
        
        let userDefaultsDate = UserDefaults.standard.value(forKey: .fetchingDate) as! Date
        
        let interval = userDefaultsDate.timeIntervalSince(secondDate!)
        
        let minute: TimeInterval = 60.0
        let hour: TimeInterval = 60.0 * minute
        let day: TimeInterval = 24 * hour
        
        if interval == day {
            XCTAssert(true)
        } else {
            XCTFail()
        }
    }
    
    func testIsFirstTimeFetching() {
        if (UserDefaults.standard.value(forKey: .fetchingDate) as? Date) != nil {
            XCTFail()
        } else {
            XCTAssert(true)
        }
    }
    
    func testUpdatingValue() {
        let date1 = Date()
        UserDefaults.standard.setValue(date1, forKey: .fetchingDate)
        
        let date2 = Date()
        UserDefaults.standard.setValue(date2, forKey: .fetchingDate)
        
        XCTAssertEqual(UserDefaults.standard.value(forKey: .fetchingDate) as! Date, date2)
        
    }
}
