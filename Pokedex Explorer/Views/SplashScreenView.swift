//
//  SplashScreenView.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 16/05/2024.
//


import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var opacity = 0.0
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .foregroundColor(Color.customOrange)
               
                
                Text("Pokedex Explorer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.customOrange)
         
            }
            .opacity(opacity)
            .onAppear {
                withAnimation(.easeIn(duration: 2.0)) {
                    self.opacity = 1.0
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
        .fullScreenCover(isPresented: $isActive) {
            HomeView() 
        }
    }
}

#Preview {
    SplashScreenView()
}
