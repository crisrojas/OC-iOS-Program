//
//  Game.swift
//  rpg
//
//  Created by Cristian Rojas on 16/07/2020.
//  MIT
//

import Foundation

class Game {
    /// Stores the players
    var players = [Player(), Player()]
    /// Creates an object "text" with all the text that we will print to the user
    var text = Text()
    /// Stores the number of characters per team (in the array player.team)
    var numberOfCharacters = 3
    /// Start the game
    func start() {
        
        text.setLang()
        welcome()
        //chooseCharacterNumber()
        namingPlayers()
        play()
        gameStats()
        restart()
    }
    
    /// Allows user to choose the number of characters and limits his choice to a choosen range
    func chooseCharacterNumber() { numberOfCharacters = Utilities.waitForInput(message: text.chooseNumberOfCharacters, condition: 2...10) }
    
    /// Welcomes the user and prints the game's logo
    func welcome() {
        print("\(text.welcome)\n\n")
        print("  /$$$$$$$  /$$$$$$$   /$$$$$$  /$$      /$$                 /$$\n | $$__  $$| $$__  $$ /$$__  $$| $$$    /$$$                | $$\n | $$  \\ $$| $$  \\ $$| $$  \\__/| $$$$  /$$$$  /$$$$$$   /$$$$$$$ /$$$$$$$   /$$$$$$   /$$$$$$$ /$$$$$$$\n | $$$$$$$/| $$$$$$$/| $$ /$$$$| $$ $$/$$ $$ |____  $$ /$$__  $$| $$__  $$ /$$__  $$ /$$_____//$$_____/\n | $$__  $$| $$____/ | $$|_  $$| $$  $$$| $$  /$$$$$$$| $$  | $$| $$  \\ $$| $$$$$$$$|  $$$$$$|  $$$$$$\n | $$  \\ $$| $$      | $$  \\ $$| $$\\  $ | $$ /$$__  $$| $$  | $$| $$  | $$| $$_____/ \\____  $$\\____  $$\n | $$  | $$| $$      |  $$$$$$/| $$ \\/  | $$|  $$$$$$$|  $$$$$$$| $$  | $$|  $$$$$$$ /$$$$$$$//$$$$$$$/\n |__/  |__/|__/       \\______/ |__/     |__/ \\_______/ \\_______/|__/  |__/ \\_______/|_______/|_______/\n\n")
    }
    
    /// Creates the players and his team
    func namingPlayers() {
        
        for i in 0..<players.count {
            var name = ""
            repeat {
                print("👤 Player \(i+1), \(text.chooseYourName)")
                name = readLine()!.normalize()
            } while name.isBlank
            
            players[i].name = name
            players[i].createCharacters()
            
        }
    }
    
    /// Made players chose their moves in alternating turns
    func play() {
        while players[0].teamIsDead() == false && players[1].teamIsDead() == false {
            players[0].move(against: players[1])
            players[0].count += 1
            if players[1].teamIsDead() == false {
                players[1].move(against: players[0])
                players[1].count += 1
            }
        }
    }
    
    /// Shows information about the winner (name, characters alive...) and the number of movements of both players
    func gameStats() {
        
        for player in players {
            if player.teamHealth > 0 {
                print("🔥🔥🔥🔥🔥")
                print("\(player.name) \(text.won) 💪!")
                print("\(player.team.count) \(text.leftoutof) \(numberOfCharacters): ")
                for character in player.team {
                    print("\(character.name) 💉: \(character.health) + 💪: \(character.weapon.power)")
                }
                
            }
            print("\(player.name): \(player.count) \(text.movements)") 
            
        }
    }
    
    /// Allows the user to choose wether restart the game or not at the end of a match
    func restart() {
        var choice = ""
        repeat {
            print("Restart y/n")
            choice = readLine()!
        } while choice != "y" && choice != "n"
        
        if choice == "y" { reset() ; start() } else { return }
    }
    
    ///Resets the game by removing the old players
    func reset() { players.removeAll() ; players = [Player(), Player()] }
}
