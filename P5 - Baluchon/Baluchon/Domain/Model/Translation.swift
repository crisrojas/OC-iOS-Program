//
//  Translation.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/01/2021.
//

// MARK: - DataClass
struct TranslationData: Decodable, Equatable {
    let translations: [Translation]
}

// MARK: - Translation
struct Translation: Decodable, Equatable {
    let translatedText: String
    let detectedSourceLanguage: String
}
