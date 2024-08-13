//
//  String+appTexts.swift
//  Baluchon
//
//  Created by Cristian Rojas on 07/02/2021.
//

import Foundation

enum S {
    
    // MARK: - Generics
    static let french = "french".localized
    static let english = "english".localized
    static let ok = "ok".localized
    static let retry = "retry".localized
    static let attention = "attention".localized
    
    // MARK: - Weather
    static let weather = "weather".localized
    
    // MARK: - Exchange
    static let convert = "convert".localized
    static var formatedRate: (Float) -> (String) = { rate in
        let rateString = String(format: "%.2f", rate) + Symbols.usd.string
        return "1\(Symbols.eur.string) = \(rateString)"
    }
    
    // MARK: - Translation
    static let translate = "translate".localized
    static let translateInputPlaceholder = "translate_input_placeholder".localized
    static let translateOutputPlaceholder = "translate_output_placeholder".localized
    
    // MARK: - Error
    static let errorLocalWeather = "error_local_weather".localized
    static let errorDestinationWeather = "error_destination_weather".localized
    static let errorExchange = "error_exchange".localized
    static let errorTranslation = "error_translation".localized
    static let errorDate = "error_casting_date".localized
}

