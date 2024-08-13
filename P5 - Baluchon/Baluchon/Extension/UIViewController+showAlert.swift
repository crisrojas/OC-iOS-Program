//
//  UIViewController+showAlert.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import UIKit

extension UIViewController {
    func showErrorAlert(message: String, retryAction: @escaping () -> ()) {
        let alert = UIAlertController(title: S.attention, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: S.ok, style: .default)
        
        let retryAction = UIAlertAction(title: S.retry, style: .default) { _ in
            retryAction()
        }
        
        alert.addAction(okAction)
        alert.addAction(retryAction)
        present(alert, animated: true)
    }
}
