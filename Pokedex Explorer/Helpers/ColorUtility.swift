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
    
    
    static func getColorForType(type: String) -> Color {
        switch type {
        case "normal":
            return Color.gray
        case "fighting":
            return Color.red
        case "flying":
            return Color.blue
        case "poison":
            return Color.purple
        case "ground":
            return Color(hue: 0.09, saturation: 0.67, brightness: 0.67)
        case "rock":
            return Color(hue: 0.12, saturation: 0.80, brightness: 0.72)
        case "bug":
            return Color(hue: 0.17, saturation: 0.59, brightness: 0.72)
        case "ghost":
            return Color(hue: 0.75, saturation: 0.33, brightness: 0.83)
        case "steel":
            return Color(hue: 0.58, saturation: 0.39, brightness: 0.77)
        case "fire":
            return Color.orange
        case "water":
            return Color.blue
        case "grass":
            return Color.green
        case "electric":
            return Color.yellow
        case "psychic":
            return Color(hue: 0.94, saturation: 0.32, brightness: 0.84)
        case "ice":
            return Color(hue: 0.53, saturation: 0.57, brightness: 0.98)
        case "dragon":
            return Color(hue: 0.66, saturation: 0.75, brightness: 0.82)
        case "dark":
            return Color.black
        case "fairy":
            return Color.pink
        default:
            return Color.gray
        }
    }

}

