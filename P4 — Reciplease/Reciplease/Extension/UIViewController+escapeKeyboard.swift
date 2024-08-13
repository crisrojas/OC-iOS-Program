//
//  UIViewController+escapeKeyboard.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 28/03/2021.
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
