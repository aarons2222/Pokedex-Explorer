//
//  PokemonDetails.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import Foundation



struct PokemonDetails: Decodable {
    var name = ""
    var height = 0
    var weight = 0
    var baseExperience = 0
    var types = [Types]()
    var stats = [Stats]()

    
    var formattedName: String {
        if name.count != 0 {
            return String(Array(name)[0].uppercased() + name.dropFirst())
        }
        
        return ""
    }
}

struct Stats: Decodable {
    struct Stat: Decodable {
        var name = ""
    }
    
    var baseStat = 0
    var stat: Stat
    

    
    var maximumStat: Int {
        if stat.name == "hp" {
            return baseStat * 2 + 404
        } else {
            return Int(Double(baseStat * 2 + 99) * 1.1)
        }
    }
}

struct Types: Decodable {
    struct `Type`: Decodable {
        var name = ""
    }
    
    var type: Type
}

