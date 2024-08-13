//
//  UIImage+getShadow.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import UIKit

extension UIImage {
    static func getShadow() -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 1, height: 10)
        
        let color1 = UIColor.black.cgColor.copy(alpha: 0.2)!
        let color2: CGColor = UIColor.white.cgColor.copy(alpha: 0)!
        gradientLayer.colors = [color2, color1]
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
