//
//  Lang.swift
//  rpg
//
//  Created by Cristian Rojas on 16/07/2020.
//  MIT
//

/// Declares all the strings we're going to print to the user in the game
struct Text {
    
    var welcome = "\n\nWelcome to RPG madness"
    var chooseYourName = "what's your name?"
    var nameCharacter = "Name the character"
    var nameConstraints = "Name can't be empty nor taken"
    var chooseKind = "Choose the kind of the character"
    var character = "Character"
    var won = "won"
    var attack = "Attack"
    var heal = "Heal"
    var whoAttacks = "Who's going to attack?"
    var whoHeals = "Who's going to heal?"
    var whoIsAttacked = "Who's going to be attacked?"
    var whoIsHealed = "Who's going to be healed?"
    var healthIs = "health is now:"
    var isDead = "is dead!"
    var chooseNumberOfCharacters = "Choose the number of characters per player (at least 2)"
    var knight = "Knight"
    var magician = "Magician"
    var archer = "Archer"
    var foundWeapon = "has found a weapon. Power: "
    var turn = "Turn:"
    var enterNumber = "Enter number"
    var leftoutof = "left characters out of"
    var movements = "movements"
    
    /// Allows user to choose the game language. Declared as a mutating function because the strings are stored in a struct
    mutating func setLang() {
        
        let languages = "\n\n\n1. 🥖 Français"
        + "\n2. 💃🏻 Español"
        + "\n3. 🏈 English"
        
        let choice = Utilities.waitForInput(message: languages, condition: 1...3)
        
        /// Changes the languege of the game strings to the choosen one
        switch choice {
        case 1:
            welcome = "\n\nBienvenu à RPGmadness"
            chooseYourName = "quel est ton prenom?"
            nameCharacter = "Donne un nom au personnage"
            nameConstraints = "Le nom ne peut pas être vide ni repété"
            chooseKind = "Chossi la classe du personage"
            character = "Personnage"
            won = "gagne"
            attack = "Attaquer"
            heal = "Guérir"
            whoAttacks = "Qui va à attaquer?"
            whoHeals = "Qui va guérir?"
            whoIsAttacked = "Qui sera attaqué?"
            whoIsHealed = "Qui sera guéri?"
            healthIs = "vie:"
            isDead = "est mort!"
            chooseNumberOfCharacters = "Choissisez le nombre de personnages par joueur (2 au minimum)"
            knight = "Chevalier"
            magician = "Magicien"
            archer = "Archer"
            foundWeapon = "a trouvé une arme. Pouvoir de l'arme:"
            turn = "Tour:"
            enterNumber = "Rentrez un numéro"
            leftoutof = "personnages restent sur"
            movements = "mouvements"
            
        case 2:
            welcome = "\n\nBienvenido a RPGmadness"
            chooseYourName = "cuál es tu nombre?"
            nameCharacter = "Da un nombre al personaje"
            nameConstraints = "El nombre no puede estar vacío ni repetido"
            chooseKind = "Elije la clase del personaje"
            character = "Personaje"
            won = "gana"
            attack = "Atacar"
            heal = "Curar"
            whoAttacks = "Quién va a atacar?"
            whoHeals = "Quién cura?"
            whoIsAttacked = "Quién será atacado?"
            whoIsHealed = "Quién será curado?"
            healthIs = "vida:"
            isDead = "ha muerto!"
            chooseNumberOfCharacters = "Elije el número de personajes por jugador (2 como mínimo)"
            knight = "Caballero"
            magician = "Mago"
            archer = "Arquero"
            foundWeapon = "ha encontrado un arma. Poder del arma:"
            turn = "Turno:"
            enterNumber = "Escribe el número"
            leftoutof = "personajes de"
            movements = "movimientos"
            
        case 3:
            return
        default:
            break
        }
    }
    
}
