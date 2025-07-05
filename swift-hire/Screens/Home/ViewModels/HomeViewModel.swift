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
    @Published private(set) var summary: Summary?
    
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
        isLoading = true
        defer { isLoading = false }
        
        let result: APIResult<UserProfile> = await apiService.fetch(endpoint: "https://dummyjson.com/c/b32d-04d9-4e6d-bf96")
        
        switch result {
        case .success(let user):
            profileManager.setUser(user)
            self.user = user
            errorMessage = nil
        case .failure(let message):
            errorMessage = message
        }
    }
    
    func getRecentJobs() async {
        isLoading = true
        defer { isLoading = false }
        try? await Task.sleep(for: .seconds(2))
        let result: APIResult<HomeApiResponse> = await apiService.fetch(endpoint: "https://dummyjson.com/c/08ae-f564-4b8e-8350")
        
        switch result {
        case .success(let res):
            recentJobs = res.jobs
            summary = res.summary
            errorMessage = nil
        case .failure(let message):
            errorMessage = message
        }
    }
}
