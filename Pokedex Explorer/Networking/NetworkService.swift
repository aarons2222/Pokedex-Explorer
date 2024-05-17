//
//  NetworkManager.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation



// Protocol defining network operations
protocol NetworkProtocol {
    func fetchData<T: Decodable>(from url: URL, method: HTTPMethod, headers: [String: String]?) async throws -> T
}



// Class responsible for network operations
class NetworkService: NetworkProtocol {
    static let shared = NetworkService()
    private let session = URLSession.shared
    
    // Method to fetch data from a URL
    func fetchData<T: Decodable>(from url: URL, method: HTTPMethod = .GET, headers: [String: String]? = nil) async throws -> T {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        // Fetch data asynchronously
        let (data, response) = try await session.data(for: request)
        
        // Check HTTP status code
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }
        
        // Decode the fetched data
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self, from: data)
    }
}
