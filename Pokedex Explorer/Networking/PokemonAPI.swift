//  PokemonAPI.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import Foundation

/// A class to manage and store URLs used in the Pokemon API.
class PokemonAPI {
    /// Base URL for the PokeAPI.
    static let baseURL = "https://pokeapi.co/api/v2"
    static let spriteBaseURL = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon"
    
    
    
    
    /// URL for fetching Pokémon sprites by ID.
    static func spriteURL(for id: Int) -> URL? {
        return URL(string: "\(spriteBaseURL)/\(id).png")
    }
    
    
    
    
    /// URL for fetching Pokémon details by ID.
    static func detailURL(for id: Int) -> URL? {
        return URL(string: "\(baseURL)/pokemon/\(id)")
    }
    
    
    
    
    /// URL for fetching a list of Pokémon with a specified limit.
    static func listURL(limit: Int = 150) -> URL? {
        return URL(string: "\(baseURL)/pokemon?limit=\(limit)")
    }
}
