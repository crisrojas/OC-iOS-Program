//
//  Strings+Localized.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 27/03/2021.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
