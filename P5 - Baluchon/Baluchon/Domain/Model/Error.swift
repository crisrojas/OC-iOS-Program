//
//  NetworkError.swift
//  Baluchon
//
//  Created by cris on 17/12/2020.
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
