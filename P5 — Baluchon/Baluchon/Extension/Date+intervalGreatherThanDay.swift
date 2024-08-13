//
//  Date+intervalGreatherThanDay.swift
//  Baluchon
//
//  Created by Cristian Rojas on 07/03/2021.
//

import Foundation

extension Date {
    func moreThanADay(from date: Date) -> Bool {
       
        /// Define a day interval in seconds = 24h * 60m * 60s
        let dayInterval: TimeInterval = 24 * 60 * 60
        
        /// Compare
        let interval = self.timeIntervalSince(date)
        
        return interval > dayInterval
    }
}
