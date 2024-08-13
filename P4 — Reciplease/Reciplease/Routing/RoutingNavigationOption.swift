//
//  RoutingNavigationOption.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 17/04/2021.
//

import Foundation

struct RoutingNavigationOption {
    let type: RoutingType
    let withNavigationController: Bool
    let isFullScreen: Bool

    init(type: RoutingType = .push,
         withNavigationController: Bool = false,
         isFullScreen: Bool = false) {
        self.type = type
        self.withNavigationController = withNavigationController
        self.isFullScreen = isFullScreen
    }
}
