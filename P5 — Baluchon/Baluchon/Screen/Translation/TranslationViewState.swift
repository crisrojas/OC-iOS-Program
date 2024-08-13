//
//  TranslationViewState.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

enum TranslationViewState: Equatable {
    case loading
    case success(Translation)
    case error(String)
    
    var isLoading: Bool {
        self == .loading
    }
}

