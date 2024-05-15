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
            List {
                ForEach(Array(vm.filteredPokemons.enumerated()), id: \.element.name) { index, pokemon in
             //       NavigationLink(destination: DetailView(pokemonUrl: pokemon.url, name: pokemon.name)) {
                    
                    NavigationLink(destination: Text("aaa")) {
                        HStack{
                            
                            asyncPokemonImage(index: index + 1)
                            
                            Text(pokemon.name)
                        }
                    }
                }
            }
            .navigationTitle("Pokemon")
            .searchable(text: $vm.searchText)
        }
    }
    
    
    
    
    func asyncPokemonImage(index: Int) -> some View {
        let imageURL = URL(string: vm.pokemonImageURL(ID: index + 1))!
        
        return AsyncImage(url: imageURL) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
    }
}



#Preview {
    MainView()
}
