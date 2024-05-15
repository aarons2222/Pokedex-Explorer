//
//  HomeViewModel.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published private(set) var pokemons: [Pokemon] = []
    @Published var searchText: String = ""
    
    private let networkManager = NetworkManager.shared
    
    init() {
        Task {
            await fetchPokemons()
        }
    }
    
    @MainActor
    private func fetchPokemons() async {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=150") else {
            return
        }
        
        do {
            let pokemonResponse: PokemonResponse = try await networkManager.fetchData(from: url)
            pokemons = pokemonResponse.results
        } catch {
            print("Error fetching Pokemon data: \(error)")
        }
    }
    
    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return pokemons.shuffled() // Return shuffled array if search text is empty
        } else {
            let filtered = pokemons.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            return filtered.shuffled() // Return shuffled filtered array
        }
    }

}
