//
//  NetworkError.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 15/05/2024.
//


// Enum representing network errors
enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}
