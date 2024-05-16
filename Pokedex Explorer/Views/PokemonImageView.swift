//  PokemonImageView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import SwiftUI
import Kingfisher

/// A view that displays a Pokémon image based on its ID.
struct PokemonImageView: View {
    /// The Pokémon ID to fetch the image for.
    let id: Int
    
    /// The frame size for the image.
    let frame: CGFloat
    
    var body: some View {
        // Load and display the Pokémon image.
        loadPokemonImage(for: id)
            .frame(width: frame, height: frame)
    }
    
    /// Loads the Pokémon image from the given ID.
    /// - Parameter id: The Pokémon ID to fetch the image for.
    /// - Returns: A view displaying the Pokémon image, a placeholder if loading, or a default image if the URL is invalid.
    private func loadPokemonImage(for id: Int) -> some View {
        // Construct the URL for the Pokémon image.
        guard let imageURL = PokemonAPI.spriteURL(for: id) else {
            // Return a default placeholder image if the URL is invalid.
            return AnyView(
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
            )
        }
        
        // Kingfisher is used to load the image from the URL.
        return AnyView(
            KFImage(imageURL)
                .resizable()
                .placeholder { // Placeholder while the image is loading.
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: frame, height: frame)
                        .opacity(0.3)
                }
                .onFailure { error in
                    // Handle image loading failure, log the error.
                    print("Error loading image: \(error.localizedDescription)")
                }
        )
    }
}

#Preview {
    PokemonImageView(id: 1, frame: 100)
}
