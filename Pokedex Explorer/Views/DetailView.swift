//
//  DetailView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject private var vm = DetailViewModel()
    
    private let id: Int
    
    let haptic = UIImpactFeedbackGenerator(style: .light)


    var backgroundColor: Color
    
    init(backgroundColor: Color, id: Int) {
        self.id = id
        self.backgroundColor = backgroundColor
        
    }
    
    var body: some View {
        
        ZStack{
            
   
            backgroundColor
                .opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                
            
   
        ScrollView {

            VStack() {
                
                PokemonImageView(id: id, frame: 200)
                
                
                Text(vm.pokemonDetails.name.firstUppercased)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                
                
                
                
             
            
                HStack {
                    ForEach(vm.pokemonDetails.types, id: \.type.name) { type in
                        
                        VStack {
                            Text(type.type.name.firstUppercased)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color.white)
                                .background(
                                    Capsule()
                                        .fill(ColorUtil.getColorForType(type: type.type.name))
                                        .frame(width: 100, height: 50)
                                )
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical)
                
           
                
                HStack {
                 
                        
                     
                    CardView(value: "\(vm.pokemonDetails.height) cm", icon: "ruler")
                        .frame(minWidth: 0, maxWidth: .infinity)
                    
                    CardView(value:"\(vm.pokemonDetails.weight) kg", icon: "scalemass")
                        .frame(minWidth: 0, maxWidth: .infinity)
                
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.vertical)
                
                
           
               
         
                HStack{
                    Text("Stats")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 20){
                    
                 
                    
                    ForEach(vm.pokemonDetails.stats, id: \.stat.name) { stat in
           
                            
                            CardView(name: vm.pokemonDetails.name, statName: stat.stat.name.capitalized, min: stat.baseStat, max: stat.maximumStat)
 
                        
                    }
                }
              
                Spacer()
            }
            .padding(.horizontal, 25)
            
        }
            
            VStack{
                HeaderView()
                    .padding(.leading)
                Spacer()
            }

        .navigationBarHidden(true)
        .task {
            await vm.fetchPokemonDetail(pokemonId: id)
        }
    }
    }
    
    
    
    @ViewBuilder
    func CardView(value: String? = nil, icon: String? = nil, name: String? = nil, statName: String? = nil, min: Int? = nil, max: Int? = nil) -> some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(name != nil ? ColorUtil.colorForName(name!).gradient : ColorUtil.colorForName(vm.pokemonDetails.name).gradient)
            .frame(height: 90)
            .overlay(alignment: .leading) {
                HStack(spacing: 12) {
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundStyle(.white.opacity(0.5))
                        .overlay {
                            if let icon = icon {
                                Image(systemName: icon)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .rotationEffect(.degrees(icon.contains("ruler") ? 90 : 0))
                            } else if let min = min {
                                Text("\(min)")
                                    .font(.title2)
                                    .fontWeight(.medium)
                            }
                        }
                    
                    if let value = value {
                        Text(value)
                            .font(.title3)
                            .fontWeight(.semibold)
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            if let statName = statName {
                                Text(statName)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                            }
                            
                            if let min = min, let max = max {
                                ProgressView(value: Double(min), total: Double(max))
                                    .tint(.white)
                                    .background(Color.gray)
                            }
                        }
                    }
                }
                .foregroundStyle(.white)
                .padding(15)
            }
    }
    
    
    


    
    @ViewBuilder
    func HeaderView() -> some View {

            Button(action: {
                    haptic.impactOccurred()
                presentationMode.wrappedValue.dismiss()
                
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 11, height: 20)
                    
                    Text("Back")
                    
                    Spacer()

                }
                .foregroundColor(.white)

            }
    
        }
    
}


#Preview {
    DetailView(backgroundColor: Color.red, id: 6)
}







//
//
//
//
//
