//
//  Pokemon.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation
import SwiftUI
import SwiftData



struct PokemonResponse: Codable {
    let results: [Pokemon]
}


struct Pokemon: Codable {
    let name: String
    let url: String
}

