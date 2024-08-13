//
//  Symbols.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import Foundation

enum Symbols {
    case eur
    case usd
    
    var string: String {
        switch self {
        case .eur: return "€"
        case .usd: return "$"
        }
    }
}
