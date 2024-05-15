//
//  DetailView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject private var vm = DetailViewModel()
    
    private let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
             
         
                        
                    PokemonImageView(id: id, frame: 160)
                        
                        
                Text(vm.pokemonDetails.name)
                      
                ForEach(vm.pokemonDetails.types, id: \.type.name) {
                    
                    
                    Text($0.type.name)
                }
                    
           
                
           
                    VStack {
                        
                        
                        
                        Text("Height")
                            .foregroundColor(Color.orange)
                        Text("\(vm.pokemonDetails.height) cm")
                        
                        Text("Weight")
                            .foregroundColor(Color.blue)
                        Text("\(vm.pokemonDetails.weight) kg")
                    }
                    
                    
         
             
                Section(header: Text("Stats").font(.headline)) {
                    ForEach(vm.pokemonDetails.stats, id: \.stat.name) { stat in
                        VStack {
                            
                            CardView(name: vm.pokemonDetails.name, statName: stat.stat.name.capitalized, min: stat.baseStat, max: stat.maximumStat)
 
                        }
                    }
                }
                
                Spacer()
            }
            .padding(25)
        }
        .navigationBarTitle(Text(vm.pokemonDetails.name.capitalized), displayMode: .inline)
        .task {
            await vm.fetchPokemonDetail(pokemonId: id)
        }
    }
    
    
    
    @ViewBuilder
    func CardView(name: String, statName: String, min: Int, max: Int) -> some View {
        
        
        RoundedRectangle(cornerRadius: 15)
            .fill(ColorUtil.colorForName(name).gradient)
            .frame(height: 90)
            .overlay(alignment: .leading) {
                HStack(spacing: 12) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.5))
                        .overlay{
                            Text("\(min)")
                                .font(.title2)
                                .fontWeight(.medium)
                        }
                    
                    VStack(alignment: .leading, spacing: 10, content: {

                        
                        Text(statName)
                            .font(.title3)
                            .fontWeight(.semibold)
                        
                        
                        
                    ProgressView(value: Double(min), total: Double(max))
                            .tint(.red)
                            .background(Color.green)
                   
             

                        
//                        RoundedRectangle(cornerRadius: 5)
//                            .frame(width: 70, height: 5)
                    })
                }
                .foregroundStyle(.white)
                .padding(15)
            }
    }
    

}


#Preview {
    DetailView(id: 6)
}




