//
//  ApiService.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 06/07/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decodingError(Error)
    case unknown(Error)
}

@MainActor
final class APIService {
    static let shared = APIService()
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    private init() {
        self.session = URLSession.shared
        self.decoder = JSONDecoder()
        self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func fetch<T: Decodable>(endpoint: String) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.statusCode(httpResponse.statusCode)
        }
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw APIError.decodingError(error)
        }
    }
}
