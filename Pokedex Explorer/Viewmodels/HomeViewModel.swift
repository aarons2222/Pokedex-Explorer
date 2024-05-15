//
//  HomeViewModel.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation
import Combine


class HomeViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var searchText: String = ""
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkManager = NetworkManager.shared

    init() {
        fetchPokemonData()
    }

    private func fetchPokemonData() {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=150") else {
            return
        }

        Task {
            do {
                let pokemonResponse: PokemonResponse = try await networkManager.fetchData(from: url)
                DispatchQueue.main.async { [weak self] in
                    self?.pokemons = pokemonResponse.results
                }
            } catch {
                print("Error fetching Pokemon data: \(error)")
            }
        }
    }


    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return pokemons
        } else {
            return pokemons.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    
    // URL for sprites
    func pokemonImageURL (ID: Int) -> String {
        return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(ID).png"
    }
}
