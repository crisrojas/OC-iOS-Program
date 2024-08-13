//
//  Knight.swift
//  rpg
//
//  Created by Cristian Rojas on 30/07/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import Foundation

class Knight : Character {
    
    init() {
        super.init(health: 130, weapon: Sword(), emoji: "🗡", healingPower: 10)
    }
}
