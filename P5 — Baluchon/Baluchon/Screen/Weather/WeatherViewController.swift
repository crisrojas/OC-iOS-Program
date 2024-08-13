//
//  WeatherViewController.swift
//  Baluchon
//
//  Created by Cristian Rojas on 19/11/2020.
//

import UIKit

class WeatherViewController: UIViewController, WeatherRepositoryOutput {
    
    @IBOutlet weak var weatherTitleLabel: UILabel!
    @IBOutlet weak var destinationView: WeatherItemView!
    @IBOutlet weak var localView: WeatherItemView!
    
    lazy var repository: WeatherRepositoryInput = {
        let repo = WeatherRepository(api: Api.openWeather)
        repo.output = self
        return repo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        repository.fetchWeather()
    }
    
    private func setupUI() {
        weatherTitleLabel.text = S.weather
        weatherTitleLabel.font = .boldSystemFont(ofSize: 28)
    }
}
