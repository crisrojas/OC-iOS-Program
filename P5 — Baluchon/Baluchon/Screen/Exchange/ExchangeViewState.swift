//
//  ExchangeViewState.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

enum ExchangeViewState: Equatable {
    case loading
    case success(ExchangeResponse)
    case error(String)
    
    var isLoading: Bool {
        self == .loading
    }
}
