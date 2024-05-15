//
//  Endpoints.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation

enum APIEndpoint {
    static let baseUrl = "https://pokeapi.co/api/v2/"
    

    
    
    
    // URL for sprites
    static func imageURL(forID id: Int) -> String {
          return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png"
      }
}


