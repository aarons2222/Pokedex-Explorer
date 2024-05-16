//
//  PokemonDetails.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//



struct PokemonDetails: Decodable {
    var name = ""
    var height = 0
    var weight = 0
    var baseExperience = 0
    var types = [Types]()
    var stats = [PokemonStat]()
}

struct PokemonStat: Codable {
    let baseStat: Int
    let effort: Int
    let stat: Stat
    
    var maximumStat: Int {
       if stat.name == "hp" {
           return baseStat * 2 + 404
       } else {
           return Int(Double(baseStat * 2 + 99) * 1.1)
       }
    }
}

struct Stat: Codable {
    let name: String
    let url: String
}

struct Types: Decodable {
    let slot: Int
    let type: TypeDetails
}

struct TypeDetails: Decodable {
    let name: String
    let url: String
}

