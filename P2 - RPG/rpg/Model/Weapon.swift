//
//  Weapon.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  MIT
//

import Foundation

class Weapon {
    /// Defines the power of the weapon
    var power : Int = 40
    
    /// Creates a weapon with a random power
    static func randomWeapon(character: Character) {
        let random = Int.random(in: 1...3)
        let matchingNumber = 1
        if random == matchingNumber {
            let factor = Double.random(in: 0.5...3.0)
            let power = Double(character.weapon.power) * factor
            character.weapon.power = Int(power)
            print("\(character.name) \(game.text.foundWeapon) \(character.weapon.power)")
        }
    }
}
