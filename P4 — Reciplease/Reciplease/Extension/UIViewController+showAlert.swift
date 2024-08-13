//
//  UIViewController+showAlert.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 04/04/2021.
//

import UIKit

extension UIViewController {
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: S.attention, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: S.ok, style: .default)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
