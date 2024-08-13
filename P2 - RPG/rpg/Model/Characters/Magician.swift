//
//  Magician.swift
//  rpg
//
//  Created by Cristian Rojas on 30/07/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import Foundation

class Magician : Character {
    
    init() {
        super.init(health: 60, weapon: Wand(), emoji: "🧙🏻‍♂️", healingPower: 35)
    }
}
