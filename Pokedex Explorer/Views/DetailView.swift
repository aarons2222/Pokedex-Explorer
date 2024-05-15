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
                            
                            CardView(title: stat.stat.name.capitalized, min: stat.baseStat, max: stat.maximumStat)
                            
                            
//                            HStack(spacing: 25) {
//                                
//                                
//                                Group {
//                                    Text(stat.stat.name.capitalized)
//                                        .fontWeight(.bold)
//                                        .frame(minWidth: 60, alignment: .leading)
//                                    Text("\(stat.baseStat)")
//                                        .frame(minWidth: 40)
//                                }
//                             ProgressBar(value: Float(stat.baseStat) / Float(stat.maximumStat))
//                            }
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
    func CardView(title: String, min: Int, max: Int) -> some View {
        
        
        RoundedRectangle(cornerRadius: 15)
            .fill(.blue.gradient)
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

                        
                        Text(title)
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


struct ProgressBar: View {
    var value: Float
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geo.size.width)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                Rectangle()
                    .foregroundColor(Color.blue)
                    .frame(width: CGFloat(self.value) * geo.size.width)
            }
            .cornerRadius(45)
        }
        .frame(height: 10)
        .padding()
    }
}
