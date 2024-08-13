//
//  WeatherDidUpdate.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import UIKit

extension WeatherViewController {
    
    func didUpdateLocal(state: WeatherViewState) {
        switch state {
        case .loadingLocal:
            localView.startAnimating()
        case .successLocal(let response):
            configureLocalComponent(with: response)
        case .errorLocal(let error):
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showErrorAlert(message: S.errorLocalWeather, retryAction: self.repository.fetchLocalWeather)
            }
            #if DEBUG
            print(error)
            #endif
        default: break
        }
    }
    
    func didUpdateDestination(state: WeatherViewState) {
        switch state {
        case .loadingDestination:
            destinationView.startAnimating()
        case .successDestination(let response):
            configureDestinationComponent(with: response)
        case .errorDestination(let error):
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showErrorAlert(message: S.errorDestinationWeather, retryAction: self.repository.fetchDestinationWeather)
            }
            
            #if DEBUG
            print(error)
            #endif
        default: break
        }
    }
    
    private func configureLocalComponent(with response: WeatherResponse) {
        DispatchQueue.main.async() { [weak self] in
            guard let self = self else { return }
            self.localView.stopAnimating()
            guard let first = response.weather.first else { return }
            self.localView.configureView(cityName: response.name,
                                         tmp: "\(response.main.temp)",
                                         state: first.description.capitalized,
                                         image: first.icon,
                                         cityImage: "chartres")
        }
    }
    
    private func configureDestinationComponent(with response: WeatherResponse) {
        DispatchQueue.main.async() { [weak self] in
            guard let self = self else { return }
            self.destinationView.stopAnimating()
            guard let first = response.weather.first else { return }
            self.destinationView.configureView(
                cityName: response.name,
                tmp: "\(response.main.temp)",
                state: first.description.capitalized,
                image: first.icon,
                cityImage: "new-york"
            )
        }
    }
}
