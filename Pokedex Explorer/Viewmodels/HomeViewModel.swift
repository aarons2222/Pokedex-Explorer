//
//  HomeViewModel.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var pokemons = [
        "Bulbasaur",
        "Ivysaur",
        "Venusaur",
        "Charmander"
    ]

  
}

#Preview {
    MainView()
}



