//
//  NotificationName+values.swift
//  Baluchon
//
//  Created by Cristian Rojas on 27/02/2021.
//

import UIKit

extension Notification.Name {
    static let keyboardWillShow = UIResponder.keyboardWillShowNotification
    static let keyboardWillHide = UIResponder.keyboardWillHideNotification
    static let willEnterForeground = Notification.Name(rawValue: "WillEnterForeground")
}
