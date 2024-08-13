//
//  Routable.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 17/04/2021.
//

import UIKit

protocol Routable {
    /// Router build with a navigationController if available
    var router: RouterProtocol? { get }
}

extension UIViewController: Routable {
    var router: RouterProtocol? {
        guard let nc = navigationController else { return nil }
        return Router(rootController: nc)
    }
}
