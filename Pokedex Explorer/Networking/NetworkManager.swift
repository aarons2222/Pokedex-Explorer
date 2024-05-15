//
//  NetworkManager.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

//  NetworkManager.swift
//  Pokedex Explorer
//
//  Created by Aaron Strickland on 14/05/2024.
//

import Foundation

// Enum representing HTTP methods
enum HTTPMethod: String {
    case GET = "GET"
}

// Enum representing network errors
enum NetworkError: Error {
    case invalidURL
    case requestFailed(Error)
    case invalidResponse
    case decodingError(Error)
}

// Protocol defining network operations
protocol NetworkProtocol {
    func fetchData<T: Decodable>(from url: URL, method: HTTPMethod, headers: [String: String]?) async throws -> T
}

// Class responsible for network operations
class NetworkManager: NetworkProtocol {
    static let shared = NetworkManager()
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
        do {
            let (data, response) = try await session.data(for: request)
            
            // Check HTTP status code
            guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                throw NetworkError.invalidResponse
            }
            
            // Decode the fetched data
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                print("decodedData \(decodedData))")
                return decodedData
            } catch {
                throw NetworkError.decodingError(error)
            }
        } catch {
            // Handle request failure
            throw NetworkError.requestFailed(error)
        }
    }
    

}
