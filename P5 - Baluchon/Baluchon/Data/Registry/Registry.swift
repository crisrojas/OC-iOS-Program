//
//  Registry.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import Foundation

enum Registry {
    static let defaults = UserDefaults.standard
    
    static func clear() {
        UserDefaults.standard.removeObject(forKey: .fetchingDate)
        UserDefaults.standard.removeObject(forKey: .exchangeRate)
    }
}

extension String {
    static let exchangeRate = "exchangeRate"
    static let fetchingDate = "fetchingDate"
}
