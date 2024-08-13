//
//  Utilities.swift
//  rpg
//
//  Created by Cristian Rojas on 30/07/2020.


import Foundation

/// Utility methods to be called within the project
class Utilities {
    
    /// Readline alike function that returns an Int? (Nil if user's input is a string)
    fileprivate static func readInt() -> Int? {
        let int : Int? = readLine().flatMap(Int.init(_:))
        return int
    }
    
    /// Ask till user enters an integer
    fileprivate static func waitForInt() -> Int {
        
        var number : Int?
        repeat {
            number = self.readInt()
        } while number == nil
        return number!
    }
    
    /// Asks user to enter an integer ranged between a choosen range.
    static func waitForInput(message: String, condition: ClosedRange<Int>) -> Int {
        var choice : Int
        repeat {
            print(message)
            choice = self.waitForInt()
        } while !condition.contains(choice)
        return choice
    }
    
    /// Checks if a string "name" exists in an array "names" and returns true if so
    static func nameExists(names: [String], name: String) -> Bool {
        var exists = false
        if names.firstIndex(of: name) != nil {
            exists = true
        }
        return exists
    }
}

extension String {
    
    ///Apply a lowercase & capitalize filter to a string
    func normalize() -> String {
        var newString = self.lowercased()
        newString = self.capitalized
        return newString
    }
    /// Checks if a string is blank
    var isBlank: Bool {
        return allSatisfy({ $0.isWhitespace })
    }
}
