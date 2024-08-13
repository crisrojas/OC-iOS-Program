//
//  UIEdgeInsets+same.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 17/04/2021.
//

import UIKit

extension UIEdgeInsets {
    static func same(with float: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: float, left: float, bottom: float, right: float)
    }
}
