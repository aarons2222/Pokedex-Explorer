//
//  DetailView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import SwiftUI


struct DetailView: View {
    
    let pokemionName: String
    
    
    var body: some View {
        
        
                Text("Pokemon Details here")
                  .navigationTitle(pokemionName)
    }
}

#Preview {
    MainView()
}
