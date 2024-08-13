//
//  Player.swift
//  rpg
//
//  Created by Cristian Rojas on 15/07/2020.
//  MIT
//

import Foundation

class Player {
    /// Player's name. Declared empty becasue we well use game.namingPlayers()
    var name = ""
    /// Array that contains the members of the team
    var team = [Character]()
    /// Creates a count variable we'll update with every move of the player
    var count = Int()
    /// Returns the total health of the team.
    var teamHealth : Int {
        var total : Int = Int()
        for character in team {
            total += character.health
        }
        return total
    }
    
    /// Checks if all the team members are dead
    func teamIsDead() -> Bool {
        return teamHealth == 0
    }
    /// Creates the caracter's inside the player.team array
    func createCharacters() {
        
        // Creates characters and appends them to the array "team"
        while team.count < game.numberOfCharacters {
            let message = "\n\n\(name), \(game.text.chooseKind) \(team.count + 1)\n"
                + "\n1.\n🗡 \(game.text.knight)\n💉: 130. 💪: 35. 👨‍⚕️: 10"
                + "\n2.\n🏹 \(game.text.archer)\n💉: 100. 💪: 60. 👨‍⚕️: 15"
                + "\n3.\n🧙🏻‍♂️ \(game.text.magician)\n💉: 60. 💪: 75. 👨‍⚕️: 35"
            let input = Utilities.waitForInput(message: message, condition: 1...3)
            
            var character = Character()
            switch input {
            case 1:
                character = Knight()
            case 2:
                character = Archer()
            case 3:
                character = Magician()
            default:
                break
            }
            
            var characterName = ""
            var names = [String]()
            repeat {
                print("\(game.text.nameCharacter) \(team.count + 1). \(game.text.nameConstraints)")
                characterName = readLine()!.normalize()
            } while characterName.isBlank || Utilities.nameExists(names: names, name: characterName)
            
            print(characterName)
            character.name = characterName
            names.append(characterName)
            team.append(character)
        }
        
    }
    
    /// Allows user to attack or to heal a team member
    func move(against player: Player) {
        let message = "\n\n\(game.text.turn) \(name)"
            + "\n1.⚔️ \(game.text.attack)"
            + "\n2.💉 \(game.text.heal)\n"
        
        let action = Utilities.waitForInput(message: message, condition: 1...2)
        action == 1 ? attack(against: player) : heal()
        
    }
    /// Allows user to chose the team member that's going to attack and the enemy that will be attacked
    func attack(against player: Player) {
        
        let range = self.rangeTeam()
        let attackerIndex = Utilities.waitForInput(message: game.text.whoAttacks + range, condition: 1...team.count) - 1
        let attacker = team[attackerIndex]
        
        Weapon.randomWeapon(character: attacker)
        
        
        let rangeEnemy = player.rangeTeam()
        let enemyIndex = Utilities.waitForInput(message: game.text.whoIsAttacked + rangeEnemy, condition: 1...player.team.count) - 1
        let enemy = player.team[enemyIndex]
        
        attacker.attackEnemy(character: enemy)
                
        if enemy.isDead() {
            
            print("\(enemy.name) \(game.text.isDead) \n")
            let characterIndex = player.team.firstIndex(of: enemy)
            player.team.remove(at: characterIndex!)
            
        } else { print("\(enemy.name) \(game.text.healthIs) \(enemy.health)") }
    }
    
    /// Allows user to increase one of his members health
    func heal() {
        
        let range = self.rangeTeam()
        
        let healerIndex = Utilities.waitForInput(message: game.text.whoHeals + range, condition: 1...team.count) - 1
        let healer = team[healerIndex]
                
        let comradeIndex = Utilities.waitForInput(message: game.text.whoIsHealed + range, condition: 1...team.count) - 1
        let comrade = team[comradeIndex]
        
        healer.healComrade(character: comrade)
        print("\(comrade.name) \(game.text.healthIs) \(comrade.health)")
    }
    
    /// Returns a string with information (name, health, power...) about all the members of the team
    func rangeTeam() -> String {
        
        var range = ""
        for i in 0..<self.team.count {
            let teamInfo = "\n\(i+1). \(team[i].emoji) \(team[i].name). 💉: \(team[i].health). 💪: \(team[i].weapon.power). 👨‍⚕️ \(team[i].healingPower)"
            range.append(teamInfo)
        }
        return range
    }
    
}
