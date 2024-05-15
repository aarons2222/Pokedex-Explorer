//
//  Pokemon.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation
import SwiftUI

struct PokemonResponse: Codable {
    let results: [Pokemon]
}


struct Pokemon: Codable, Equatable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }

    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
