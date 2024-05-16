//
//  DetailVIewModel.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import Foundation

class DetailViewModel: ObservableObject {
    private let networkManager = NetworkManager.shared
    @Published private(set) var pokemonDetails = PokemonDetails()

    @MainActor
    func fetchPokemonDetail(pokemonId id: Int) async {
        guard let url = PokemonAPI.detailURL(for: id) else {
            // Handle invalid URL
            ErrorHandler.shared.displayError(message: "Invalid URL for Pokémon ID \(id)")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decoded = try decoder.decode(PokemonDetails.self, from: data)
            pokemonDetails = decoded
        } catch {
            // Handle error
            ErrorHandler.shared.displayError(message: "Error fetching Pokémon detail: \(error.localizedDescription)")
        }
    }
}
