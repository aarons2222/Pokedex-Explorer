//
//  ColorUtility.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import SwiftUI

struct ColorUtil{
    static func colorForName(_ name: String?) -> Color {
        guard let name = name else {
            return .gray // Return a default color if name is nil
        }
        
        let startingCharacter = name.first?.lowercased() ?? " "
        let length = min(name.count, 12)
        
        switch startingCharacter {
            case "a"..."c":
                return length <= 6 ? .blue.opacity(0.8) : length <= 9 ? .blue.opacity(0.6) : .blue.opacity(0.4)
            case "d"..."f":
                return length <= 6 ? .green.opacity(0.8) : length <= 9 ? .green.opacity(0.6) : .green.opacity(0.4)
            case "g"..."i":
                return length <= 6 ? .orange.opacity(0.8) : length <= 9 ? .orange.opacity(0.6) : .orange.opacity(0.4)
            case "j"..."l":
                return length <= 6 ? .purple.opacity(0.8) : length <= 9 ? .purple.opacity(0.6) : .purple.opacity(0.4)
            case "m"..."o":
                return length <= 6 ? .red.opacity(0.8) : length <= 9 ? .red.opacity(0.6) : .red.opacity(0.4)
            case "p"..."s":
                return length <= 6 ? .yellow.opacity(0.8) : length <= 9 ? .yellow.opacity(0.6) : .yellow.opacity(0.4)
            case "t"..."v":
                return length <= 6 ? .pink.opacity(0.8) : length <= 9 ? .pink.opacity(0.6) : .pink.opacity(0.4)
            case "w"..."z":
                return length <= 6 ? .cyan.opacity(0.8) : length <= 9 ? .cyan.opacity(0.6) : .cyan.opacity(0.4)
            default:
                return .gray.opacity(0.4)
        }
    }
}

