//
//  FoodEmoji.swift
//  Reciplease
//
//  Created by Cristian Felipe Patiño Rojas on 27/03/2021.
//

enum FoodEmojis: String, CaseIterable {
    case Chicken = "🍗"
    case Tomato = "🍅"
    case Grappes = "🍇"
    case Melon = "🍈"
    case Watermelon = "🍉"
    case Tangerine = "🍊"
    case Lemon = "🍋"
    case Banana = "🍌"
    case Pineapple = "🍍"
    case Mango = "🥭"
    case Apple = "🍎"
    case Pear = "🍐"
    case Peach = "🍑"
    case Cherries = "🍒"
    case Strawberry = "🍓"
    case Kiwi = "🥝"
    case Coconut = "🥥"
    case Avocado = "🥑"
    case Eggplant = "🍆"
    case Potato = "🥔"
    case Carrot = "🥕"
    case Corn = "🌽"
    case HotPepper = "🌶️"
    case Cucumber = "🥒"
    case LeafyGreen = "🥬"
    case Broccoli = "🥦"
    case Garlic = "🧄" //
    case Onion = "🧅" //
    case Mushroom = "🍄"
    case Peanuts = "🥜"
    case Chestnut = "🌰"
    case Bread = "🍞"
    case Cheese = "🧀"
    case Beef = "🥩"
    case Bacon = "🥓"
    case Taco = "🌮"
    case Burrito = "🌯"
    case Egg = "🥚"
    case Salad = "🥗"
    case Butter = "🧈" //
    case Salt = "🧂"
    case Rice = "🍚"
    case Pasta = "🍝"
    case Shrimp = "🦐"
    case Oyster = "🦪" //
    case IceCream = "🍦"
    case Chocolate = "🍫"
    case Honey = "🍯"
    case Milk = "🥛"
    case Coffee = "☕"
    case Tea = "🍵"
    case Sake = "🍶"
    case Wine = "🍷"
    case Beer = "🍺"
    
    static var model: [String: String] {
        Dictionary(uniqueKeysWithValues: FoodEmojis.allCases.map{ ($0.name.lowercased(), $0.rawValue) })
    }
    
    var name: String {
        switch self {
        case .Chicken: return S.Chicken
        case .Tomato: return S.Tomato
        case .Grappes: return S.Grappes
        case .Melon: return S.Melon
        case .Watermelon: return S.Watermelon
        case .Tangerine: return S.Tangerine
        case .Lemon: return S.Lemon
        case .Banana: return S.Banana
        case .Pineapple: return S.Pineapple
        case .Mango: return S.Mango
        case .Apple: return S.Apple
        case .Pear: return S.Pear
        case .Peach: return S.Peach
        case .Cherries: return S.Cherries
        case .Strawberry: return S.Strawberry
        case .Kiwi: return S.Kiwi
        case .Coconut: return S.Coconut
        case .Avocado: return S.Avocado
        case .Eggplant: return S.Eggplant
        case .Potato: return S.Potato
        case .Carrot: return S.Carrot
        case .Corn: return S.Corn
        case .HotPepper: return S.HotPepper
        case .Cucumber: return S.Cucumber
        case .LeafyGreen: return S.LeafyGreen
        case .Broccoli: return S.Broccoli
        case .Garlic: return S.Garlic
        case .Onion: return S.Onion
        case .Mushroom: return S.Mushroom
        case .Peanuts: return S.Peanuts
        case .Chestnut: return S.Chestnut
        case .Bread: return S.Bread
        case .Cheese: return S.Cheese
        case .Beef: return S.Beef
        case .Bacon: return S.Bacon
        case .Taco: return S.Taco
        case .Burrito: return S.Burrito
        case .Egg: return S.Egg
        case .Salad: return S.Salad
        case .Butter: return S.Butter
        case .Salt: return S.Salt
        case .Rice: return S.Rice
        case .Pasta: return S.Pasta
        case .Shrimp: return S.Shrimp
        case .Oyster: return S.Oyster
        case .IceCream: return S.IceCream
        case .Chocolate: return S.Chocolate
        case .Honey: return S.Honey
        case .Milk: return S.Milk
        case .Coffee: return S.Coffee
        case .Tea: return S.Tea
        case .Sake: return S.Sake
        case .Wine: return S.Wine
        case .Beer: return S.Beer
        }
    }
}
