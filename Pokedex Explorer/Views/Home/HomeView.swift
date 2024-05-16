//
//  HomeView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import SwiftUI
/// HomeView displays a list of Pokémon with various sorting and filtering capabilities.
struct HomeView: View {
    /// ViewModel that manages the data and business logic for the view.
    @ObservedObject var vm = HomeViewModel()

    var body: some View {
        
        NavigationView {
            
            Group {
                
                // Display loading message if Pokémon data is still being fetched.
                if vm.pokemons.isEmpty {
                    
                    contentUnavailableView("Please wait while the Pokedex is loading", image: "bolt.trianglebadge.exclamationmark")
                    
                // Display a message if no Pokémon match the search criteria.
                    
                } else if vm.filteredPokemons.isEmpty {
                    
                    contentUnavailableView("No Pokémon named \(vm.searchText) found", image: "bolt.trianglebadge.exclamationmark")
                    
                // Otherwise, display the grid of Pokémon cards.
                } else {
                    
                    pokemonGrid
                    
                }
            }
            
            .navigationTitle("Pokémon")
            .searchable(text: $vm.searchText) // Allows for searching Pokémon by name.
            .toolbar {
                sortMenu // Provides sorting options within a dropdown menu.
            }
        }
    }

    /// Grid view displaying Pokémon cards in a lazy loading grid.
    private var pokemonGrid: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 2)) {
                
                ForEach(vm.filteredPokemons, id: \.name) { pokemon in
                    
                    if let index = pokemon.url.getID{
                        
                        NavigationLink(destination: DetailView(backgroundColor: ColorUtil.colorForName(pokemon.name), id: index)) {
                            
                            CardView(name: pokemon.name, url: pokemon.url)
                            
                        }
                        
                    }
                    
                }
                
            }
            .padding(.horizontal)
            
        }
        
    }

    /// View displayed when Pokémon data is unavailable.
    private func contentUnavailableView(_ message: String, image: String) -> some View {
        VStack {
            Image(systemName: image)
                .iconStyle()
            Text(message)
                .fontWeight(.medium)
        }
    }

    /// Menu for selecting the sorting order of Pokémon.
    private var sortMenu: some View {
        Menu("Sort") {
            Section("Sort order") {
                Button("Alphabetically A - Z") { vm.sortingOrder = .ascending }
                Button("Alphabetically Z - A") { vm.sortingOrder = .descending }
                Button("Random") { vm.sortingOrder = .random }
            }
        }
    }


}





#Preview {
    HomeView()
}
