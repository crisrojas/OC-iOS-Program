//
//  Weather.swift
//  Baluchon
//
//  Created by cris on 03/12/2020.
//

import Foundation

struct Weather: Decodable, Equatable {
    let id: Int
    let description: String
    
    var icon: String {
        switch id {
        case 200 ... 299:
            return "bolt"
        case 300 ... 399:
            return "drizzle"
        case 500 ... 599:
            return "rain"
        case 600 ... 699:
            return "snow"
        case 700 ... 799:
            return "fog"
        case 800:
            return "sun"
        case 801 ... 899:
            return "cloud"
        default:
            return  "unknown"
        }
    }
}
