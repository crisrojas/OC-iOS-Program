//
//  UITextField+addDoneToolbar.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 05/04/2021.
//

import Foundation
import UIKit

extension UITextField {
    func addDoneToolbar(onDone: (target: Any, action: Selector)? = nil) {
        let onDone = onDone ?? (target: self, action: #selector(doneButtonTapped))
        
        let toolbar: UIToolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: S.done, style: .done, target: onDone.target, action: onDone.action)
        ]
        
        toolbar.sizeToFit()
        
        self.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() { self.resignFirstResponder() }
}

