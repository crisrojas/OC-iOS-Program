//
//  TranslationDidFetch.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import UIKit

extension TranslationViewController {
    func didFetchTranslation(result: Result<TranslationResponse, Error>) {
        switch result {
        case .success(let response):
            let translation = response.data.translations[0]
            didUpdate(state: .success(translation))
        case .failure(let error):
            didUpdate(state: .error(error.type.message))
        }
    }
}
