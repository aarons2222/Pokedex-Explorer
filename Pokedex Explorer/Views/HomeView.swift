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
        NavigationStack{
            
            
            List(vm.pokemons, id: \.self){ pokemon in
                NavigationLink(pokemon, value: pokemon)
            }
            .navigationDestination(for: String.self, destination: DetailView.init)
            .navigationTitle("Pokemon")
        }
    }
}

#Preview {
    MainView()
}
