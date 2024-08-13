//
//  Error.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 05/04/2021.
//

import Foundation

enum ErrorType: Equatable {
    case invalidURL
    case noDataError
    case decodingError
    case networkError
    
    var message: String {
        switch self {
        case .invalidURL:
            return "Invalid url"
        case .noDataError:
            return "No data found"
        case .decodingError:
            return "Fail while decoding"
        case .networkError:
            return "Network error"
        }
    }
}

struct Error: Swift.Error {
    let type: ErrorType
}
