//
//  BookmarkViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

@MainActor
class BookmarkViewModel: ObservableObject {
    @Published var savedJobs: [Job] = [
        Job(
            companyLogo: "googleIcon",
            logoBackgroundColor: Color.yellow,
            jobTitle: "Product Designer",
            location: "California, USA",
            salary: "$15K",
            timeUnit: "Mo",
            tags: ["Product Designer", "Full Time"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "dribbbleIcon",
            logoBackgroundColor: Color.pink,
            jobTitle: "Software Engineer",
            location: "Redmond, WA",
            salary: "$18K",
            timeUnit: "Mo",
            tags: ["Software Engineer", "Full Time"],
            isBookmarked: false
        )
    ]
}
