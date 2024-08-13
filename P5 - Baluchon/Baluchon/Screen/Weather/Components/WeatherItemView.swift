//
//  WeatherItemView.swift
//  Baluchon
//
//  Created by Cristian Rojas on 23/01/2021.
//

import UIKit

@IBDesignable
final class WeatherItemView: UIView {
    
    @IBOutlet private weak var bgImage: UIImageView!
    @IBOutlet private weak var pictoImage: UIImageView!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tmpLabel: UILabel!
    @IBOutlet private weak var stateLabel: UILabel!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!

    private let cornerRadius: CGFloat = 16
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    func configureView(cityName: String,
                       tmp: String,
                       state: String,
                       image: String,
                       cityImage: String) {
        
            self.setupUI()
            self.cityLabel.text = cityName
            self.tmpLabel.text = "\(tmp) °"
            self.stateLabel.text = state
            self.pictoImage.image = UIImage(named: image)
            self.bgImage.image = UIImage(named: cityImage)
        
    }
    
    func startAnimating() {
        activityIndicator.startAnimating()
        cityLabel.isHidden = true
        tmpLabel.isHidden = true
        stateLabel.isHidden = true
    }
    
    func stopAnimating() {
        activityIndicator.stopAnimating()
        
        cityLabel.isHidden = false
        tmpLabel.isHidden = false
        stateLabel.isHidden = false
        
        guard let first = self.subviews.first else { return }
        first.backgroundColor = .clear
    }
}

private extension WeatherItemView {
    func configureView() {
        guard let view = self.loadViewFromNib(nibName: "WeatherItemView") else { return }
        view.frame = self.bounds
        view.layer.cornerRadius = cornerRadius
        self.addSubview(view)
        activityIndicator.hidesWhenStopped = true
    }
    
    func setupUI() {
        cityLabel.textColor = .white
        tmpLabel.textColor = .white
        stateLabel.textColor = .white
        
        tmpLabel.font = .boldSystemFont(ofSize: 32)
        
        pictoImage.tintColor = .white
        bgImage.addBlackGradientLayerInForeground(frame: self.bounds, colors: [UIColor.clear, UIColor.black])
        bgImage.layer.cornerRadius = 16
    }
}
