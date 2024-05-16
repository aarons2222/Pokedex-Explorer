//
//  CardView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 16/05/2024.
//

import SwiftUI


/// CardView displays a single Pokémon with its name and image.
struct CardView: View {
    let name: String
    let url: String

    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(ColorUtil.colorForName(name).gradient)
            .frame(height: 150)
            .overlay(
                cardOverlay(name: name, url: url)
            )
    }

    /// Overlay content for the CardView, placing the name and image appropriately.
    @ViewBuilder
    private func cardOverlay(name: String, url: String) -> some View {
        VStack(alignment: .leading) {
            Text(name.capitalized)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding(.top, 15)
                .padding(.leading, 15)
            
            Spacer()
            
            HStack {
                Spacer()
                PokemonImageView(id: url.getID ?? 1, frame: 110)
                    .padding(.bottom, 5)
            }
        }
    }
    
    

}
