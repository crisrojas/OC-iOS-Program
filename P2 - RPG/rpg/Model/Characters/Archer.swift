//
//  Archer.swift
//  rpg
//
//  Created by Cristian Rojas on 30/07/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import Foundation

class Archer : Character {
    
    init() {
        super.init(health: 100, weapon: Arc(), emoji: "🏹", healingPower: 15)
    }
}
