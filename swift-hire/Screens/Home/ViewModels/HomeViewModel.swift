//
//  HomeViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI
import Combine

@MainActor
class HomeViewModel: ObservableObject {
    @Published private(set) var user: UserProfile?
    @Published private(set) var isLoading: Bool = false
    
    @Published private(set) var errorMessage: String?
    
    private let apiService = APIService.shared
    private let profileManager = UserProfileManager.shared
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var recentJobs: [Job] = []
    
    init() {
        
        Task {
            await fetchUserProfile()
            await getRecentJobs()
        }
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
            let user: UserProfile = try await apiService.fetch(endpoint: "https://dummyjson.com/c/b32d-04d9-4e6d-bf96")
            profileManager.setUser(user)
            self.user = user
            isLoading = false
        } catch {
            //                handleError(error)
        }
    }
    
    func getRecentJobs() async {
        do {
            isLoading = true
            let jobs: [Job] = try await apiService.fetch(endpoint: "https://dummyjson.com/c/9e6d-424c-404e-ba24")
            recentJobs = jobs
            isLoading = false
        } catch {
            handleError(error)
        }
    }
    
    private func handleError(_ error: Error) {
        isLoading = false
        
        if let apiError = error as? APIError {
            switch apiError {
            case .invalidURL:
                errorMessage = "Invalid URL"
            case .invalidResponse:
                errorMessage = "Invalid server response"
            case .statusCode(let code):
                errorMessage = "Server error: \(code)"
            case .decodingError(let error):
                errorMessage = "Failed to decode response: \(error.localizedDescription)"
            case .unknown(let error):
                errorMessage = "Unknown error: \(error.localizedDescription)"
            }
        } else {
            errorMessage = error.localizedDescription
        }
        
        print("API Error: \(error)")
    }
}
