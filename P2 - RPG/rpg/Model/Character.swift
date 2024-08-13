//
//  Character.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  MIT 
//

import Foundation

class Character {
    
    /// Defines the character's name as an empty string. It will be defined later on
    var name : String = ""
    /// Defines the health of the Character
    var health : Int
    /// Creates a weapon for the character
    var weapon : Weapon
    /// Defines the emoji of the character
    var emoji : String
    /// Defines the healing power
    var healingPower : Int
    
    
    init(health: Int, weapon: Weapon, emoji: String, healingPower: Int) {
        
        self.health = health
        self.weapon = weapon
        self.emoji = emoji
        self.healingPower = healingPower
        
    }
    
    convenience init() { self.init(health: 100, weapon: Weapon(), emoji: "👤", healingPower: 10) }
    
    /// Heal a team member
    func healComrade(character: Character) { character.health += healingPower }
    /// Attack a member of the other team
    func attackEnemy(character: Character) { character.receiveDamage(damage: weapon.power) }
    
    /// Receive's damage if attacked by the enemy
    func receiveDamage(damage: Int) {
        health -= damage
        health = health < 0 ? 0 : health
    }
    
}

// PROTOCOLS AND HELPERS

extension Character: Equatable {
    /// Allows to distinguish characters
    static func ==(firstCharacter: Character, secondCharacter: Character) -> Bool {
        return firstCharacter.name == secondCharacter.name
    }
    /// Checks if a character is dead
    func isDead() -> Bool { return health <= 0 }
}
