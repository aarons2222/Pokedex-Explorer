//
//  Image+Extension.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 16/05/2024.
//

import SwiftUI

/// Image extension to standardize icon styling across the app.
extension Image {
    func iconStyle() -> some View {
        self
            .resizable()
            .scaledToFit()
            .frame(width: 48, height: 48)
            .foregroundColor(.gray)
    }
}
