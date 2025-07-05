//
//  UserProfileManager.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 06/07/25.
//

import SwiftUI

@MainActor
final class UserProfileManager: ObservableObject {
    
    static let shared = UserProfileManager()
    
    @Published var user: UserProfile? = nil
    
    @Published var savedJobs: [Job] = []
    
    private init() {}
    
    func setUser(_ profile: UserProfile) {
        user = profile
    }
    
    func clearProfile() {
        user = nil
        savedJobs = []
    }
    
    func setSavedJobs(_ jobs: [Job]) {
        savedJobs = jobs
    }
    
    func removeProviderFromFavorites(_ job: Job) {
        DispatchQueue.main.async { [weak self] in
            self?.savedJobs = self?.savedJobs.filter { $0.id != job.id } ?? []
        }
    }
    
    func saveJob(_ job: Job) {
        DispatchQueue.main.async { [weak self] in
            self?.savedJobs.insert(job, at: 0)
        }
    }
    
}
