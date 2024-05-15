//
//  HomeView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var vm = HomeViewModel()


    var body: some View {
        NavigationView {
            if vm.filteredPokemons.isEmpty {
              ContentUnavailableView("No Pokemons named \(vm.searchText) found", image: "bolt.trianglebadge.exclamationmark")
            } else {
                List {
                    ForEach(vm.filteredPokemons, id: \.name) { pokemon in
                        let inde = getPokemonNumber(from: pokemon.url)!
                        NavigationLink(destination: DetailView(id: inde)) {
                            HStack {
                                PokemonImageView(id: getPokemonNumber(from: pokemon.url)!, frame: 130)
                                Text(pokemon.name)
                            }
                        }
                    }
                }
            }
        
        }
        
        .navigationTitle("Pokemon")

        .searchable(text: $vm.searchText)

    }
    
    
    
    
    func getPokemonNumber(from url: String) -> Int? {
        // Remove trailing slash if present
        let trimmedURL = url.hasSuffix("/") ? String(url.dropLast()) : url
        // Split the URL components by "/"
        let components = trimmedURL.components(separatedBy: "/")
        
        // Guard against invalid URL format
        guard let lastComponent = components.last else {
            return nil
        }
        
        // Attempt to parse the last component as an integer
        guard let number = Int(lastComponent) else {
            return nil
        }
        
        return number
    }


}



#Preview {
    MainView()
}
