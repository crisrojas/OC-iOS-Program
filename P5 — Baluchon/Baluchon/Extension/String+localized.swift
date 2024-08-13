//
//  Strings+localize.swift
//  Baluchon
//
//  Created by Cristian Rojas on 07/02/2021.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
