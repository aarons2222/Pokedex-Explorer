//
//  String+Extension.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 16/05/2024.
//

import Foundation

extension String {
    /// Extracts the Pokémon ID from a URL string.
    var getID: Int? {
        components(separatedBy: "/").compactMap(Int.init).last
    }
}
