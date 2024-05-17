//
//  DetailVIewModel.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import Foundation

class DetailViewModel: ObservableObject {
    private let networkService: NetworkProtocol
    @Published private(set) var pokemonDetails = PokemonDetails()

    // Dependency injection through initializer
    init(networkService: NetworkProtocol = NetworkService.shared) {
        self.networkService = networkService
    }

    @MainActor
    func fetchPokemonDetail(pokemonId id: Int) async {
        guard let url = PokemonAPI.detailURL(for: id) else {
            return
        }

        print("url \(url)")

        do {
            // Call fetchData with default values for method and headers
            let details: PokemonDetails = try await networkService.fetchData(from: url, method: .GET, headers: nil)
            pokemonDetails = details
        } catch {
            // Handle error
            print("Error fetching Pokemon detail: \(error)")
        }
    }
}
