//
//  GoogleTranslateApi.swift
//  Baluchon
//
//  Created by cris on 19/12/2020.
//

import Foundation

protocol GoogleTranslateApiInput {
    func getTranslation(query: String, completion: @escaping ((Result<TranslationResponse, Error>) -> Void))
}

class GoogleTranslateApi: GoogleTranslateApiInput {
    func getTranslation(query: String, completion: @escaping ((Result<TranslationResponse, Error>) -> Void)) {
        let url = GoogleTranslate.translate(query: query).url
        URLSession.decode(url: url, into: TranslationResponse.self, with: completion)
    }
}
