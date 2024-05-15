//
//  StringProtocol+Extension.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import Foundation


extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
}
