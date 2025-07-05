//
//  ApiService.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 06/07/25.
//

import Foundation

enum APIResult<T: Decodable> {
    case success(T)
    case failure(String)
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
    
    func fetch<T: Decodable>(endpoint: String) async -> APIResult<T> {
        
        guard let url = URL(string: endpoint) else {
            return .failure("Invalid URL")
        }
        
        do {
            let (data, response) = try await session.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure("Invalid server response")
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                return .failure("Server error: \(httpResponse.statusCode)")
            }
            
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                return .success(decodedData)
            } catch {
                return .failure("Failed to decode response: \(error.localizedDescription)")
            }
        } catch {
            return .failure("Network request failed: \(error.localizedDescription)")
        }
    }
}
