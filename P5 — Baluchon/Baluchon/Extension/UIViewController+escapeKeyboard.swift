//
//  UIViewController+escapeKeyboard.swift
//  Baluchon
//
//  Created by Cristian Rojas on 20/02/2021.
//

import UIKit

extension UIViewController {
    func escapeKeyboard() {
        let closeKeyboard = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        self.view.addGestureRecognizer(closeKeyboard)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
