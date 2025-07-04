//
//  BookmarkViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

@MainActor
class BookmarkViewModel: ObservableObject {
    @Published var savedJobs: [Job] = []
    
    func addBookmark(_ job: Job) {
        if savedJobs.contains(where: { $0.id == job.id }) {
            savedJobs = savedJobs.filter { $0.id != job.id }
        } else {
            savedJobs.append(job)
        }
    }
    
    func removeAllBookmarks() {
        savedJobs.removeAll()
    }
    
    func isBookmarked(_ job: Job) -> Bool {
        savedJobs.contains(where: { $0.id == job.id })
    }
}
