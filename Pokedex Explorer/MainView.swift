//
//  ContentView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
   
        
    
        TabView{
            HomeView()
                .tabItem {
                    Label("Pokemon", systemImage: "list.dash")
                }
            FavouritesView()
                .tabItem {
                    Label("Favourites", systemImage: "star")
                }
        }
    }
}

#Preview {
    MainView()
}
