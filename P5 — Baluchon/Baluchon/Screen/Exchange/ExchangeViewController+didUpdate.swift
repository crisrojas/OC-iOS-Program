//
//  ExchangeDidUpdate.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import Foundation

extension ExchangeViewController {
    
    func didUpdate(state: ExchangeViewState) {
        if state.isLoading {
            activityIndicator.startAnimating()
            self.rateLabel.isHidden = true
        } else {
            DispatchQueue.main.async { [weak self] in
                self?.activityIndicator.stopAnimating()
            }
        }
        
        switch state {
        case .success(let response):
            DispatchQueue.main.async { [weak self] in
                let rate: Float = response.rates.usd
                self?.setUserDefaults(rate: rate)
                self?.formatAndDisplay(rate: rate)
            }
        case .error(let error):
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showErrorAlert(message: S.errorExchange, retryAction: self.repository.fetchExchange)
            }
            #if DEBUG
            print(error)
            #endif
        default: break
        }
    }
}

private extension ExchangeViewController {
    func setUserDefaults(rate: Float) {
        UserDefaults.standard.setValue(rate, forKey: .exchangeRate)
        UserDefaults.standard.setValue(Date(), forKey: .fetchingDate)
    }
    
    func formatAndDisplay(rate: Float) {
        rateLabel.text = S.formatedRate(rate)
        rateLabel.isHidden = false
    }
}
