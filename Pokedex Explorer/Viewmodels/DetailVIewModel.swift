//
//  DetailVIewModel.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    private let networkManager = NetworkManager.shared
    @Published private(set) var pokemonDetails = PokemonDetails()

    func fetchPokemonDetail(pokemonId id: Int) async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)") else {
            // Handle invalid URL
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
            print("Error fetching Pokemon detail: \(error)")
        }
    }
}