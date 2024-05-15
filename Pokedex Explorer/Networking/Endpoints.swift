//
//  Endpoints.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation

enum APIEndpoint {
    static let baseUrl = "https://pokeapi.co/api/v2/"
    
    case pokemonList
    case pokemonDetail(id: Int)
    
    var url: URL {
        switch self {
        case .pokemonList:
            return URL(string: "\(APIEndpoint.baseUrl)pokemon?limit=150")!
        case .pokemonDetail(let id):
            return URL(string: "\(APIEndpoint.baseUrl)pokemon/\(id)")!
        }
    }
}


