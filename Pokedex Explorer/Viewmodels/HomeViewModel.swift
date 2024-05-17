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
    @Published var sortingOrder: SortingOrder = .byID

    private let networkService: NetworkProtocol
    
    // Dependency injection through initializer
    init(networkService: NetworkProtocol = NetworkService.shared) {
        self.networkService = networkService
        Task {
            await fetchPokemons()
        }
    }
    
    @MainActor
    public func fetchPokemons() async {
        guard let url = PokemonAPI.listURL(limit: 100) else {
            // Handle invalid URL
            return
        }
        
        do {
            let pokemonResponse: PokemonResponse = try await networkService.fetchData(from: url, method: .GET, headers: nil)
            pokemons = pokemonResponse.results
        } catch {
            // Handle API call errors here
            print("Error fetching Pokemon data: \(error)")
        }
    }

    var filteredPokemons: [Pokemon] {
        if searchText.isEmpty {
            return sortPokemons(pokemons, order: sortingOrder) // Sort the whole array if search text is empty
        } else {
            let filtered = pokemons.filter { $0.name.lowercased().contains(searchText.lowercased()) }
            return sortPokemons(filtered, order: sortingOrder) // Sort filtered array
        }
    }

    func sortPokemons(_ pokemons: [Pokemon], order: SortingOrder) -> [Pokemon] {
        switch order {
            case .ascending:
                return pokemons.sorted { $0.name.lowercased() < $1.name.lowercased() }
            case .descending:
                return pokemons.sorted { $0.name.lowercased() > $1.name.lowercased() }
            case .random:
                return pokemons.shuffled()
            case .byID:
                return pokemons
        }
    }
}
