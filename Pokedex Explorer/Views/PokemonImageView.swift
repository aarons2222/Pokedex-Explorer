//
//  PokemonImageView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import SwiftUI
import Kingfisher


struct PokemonImageView: View {
    let id: Int
    let frame: CGFloat
    
    var body: some View {
        asyncPokemonImage(id: id)
         
    }
    
    private func asyncPokemonImage(id: Int) -> some View {
        let imageURL = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id).png")!
        
        return KFImage(imageURL)
            .resizable()
        
        
//        AsyncImage(url: imageURL) { image in
//            image.resizable()
//        } placeholder: {
//            ProgressView()
//        }
        .frame(width: frame, height: frame)
    }
}
