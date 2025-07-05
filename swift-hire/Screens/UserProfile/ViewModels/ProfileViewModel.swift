//
//  ProfileViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 06/07/25.
//

import SwiftUI
import Combine

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: UserProfile?
    
    private let profileManager = UserProfileManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published var isLoading: Bool = false
//    @Published var user: UserProfile?
    @Published var errorMessage: String?
    
    init() {
        observeUserProfile()
    }
    
    func observeUserProfile() {
        profileManager.$user
            .receive(on: DispatchQueue.main)
            .sink { [weak self] user in
                self?.user = user
            }
            .store(in: &cancellables)
    }
    
    func fetchUserProfile() async {
        do {
            isLoading = true
            let url = URL(string: "https://dummyjson.com/c/b32d-04d9-4e6d-bf96")!
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // Check HTTP response status
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }
            
            // Decode JSON
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // if your JSON uses snake_case
            let decodedUser = try decoder.decode(UserProfile.self, from: data)
            
            user = decodedUser
            
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
            print("Failed to fetch user profile: \(error)")
        }
    }
}
