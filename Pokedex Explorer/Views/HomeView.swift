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
                
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
                        
                        
                        ForEach(vm.filteredPokemons, id: \.name) { pokemon in

                        
                            let inde = getPokemonNumber(from: pokemon.url)!
                            NavigationLink(destination: DetailView(id: inde)) {
                            CardView(name: pokemon.name, url: pokemon.url)
                            }
                            
                        }
                    })
                    .padding(15)
                }
                .scrollIndicators(.hidden)
                .scrollClipDisabled()
                .mask {
                    Rectangle()
                        .padding(.bottom, -100)
                }

                
                
                
//                List {
//                    ForEach(vm.filteredPokemons, id: \.name) { pokemon in
//                        let inde = getPokemonNumber(from: pokemon.url)!
//                        NavigationLink(destination: DetailView(id: inde)) {
//                            HStack {
//                                PokemonImageView(id: getPokemonNumber(from: pokemon.url)!, frame: 130)
//                                Text(pokemon.name)
//                            }
//                        }
//                    }
//                }
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
    
    
    
    
    @ViewBuilder
    func CardView(name: String, url: String) -> some View {
        
        
        RoundedRectangle(cornerRadius: 15)
            .fill(ColorUtil.colorForName(name).gradient)
            .frame(height: 150)
            .overlay {
                VStack(alignment: .leading) {
                    Text(name.firstUppercased)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .padding(15)
      
                    
                    Spacer(minLength: 0)
                    
                    PokemonImageView(id: getPokemonNumber(from: url)!, frame: 110)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        
    }

    
    



}



#Preview {
    MainView()
}
