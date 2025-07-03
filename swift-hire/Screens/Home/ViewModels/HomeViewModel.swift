//
//  HomeViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var recentJobs: [Job] = [
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
        ),
        Job(
            companyLogo: "twitterIcon",
            logoBackgroundColor: Color.blue,
            jobTitle: "Data Scientist",
            location: "Austin, TX",
            salary: "$20K",
            timeUnit: "Mo",
            tags: ["Data Scientist", "Contract"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "facebookIcon",
            logoBackgroundColor: Color(.sRGB, red: 0.25, green: 0.33, blue: 0.63, opacity: 1),
            jobTitle: "UX Designer",
            location: "Seattle, WA",
            salary: "$16K",
            timeUnit: "Mo",
            tags: ["UX Designer", "Full Time"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "appleIcon",
            logoBackgroundColor: Color.gray,
            jobTitle: "iOS Developer",
            location: "Cupertino, CA",
            salary: "$22K",
            timeUnit: "Mo",
            tags: ["iOS Developer", "Full Time"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "dribbbleIcon",
            logoBackgroundColor: Color.orange,
            jobTitle: "Backend Engineer",
            location: "New York, NY",
            salary: "$19K",
            timeUnit: "Mo",
            tags: ["Backend Engineer", "Contract"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "linkedin",
            logoBackgroundColor: Color.blue.opacity(0.7),
            jobTitle: "Frontend Developer",
            location: "San Francisco, CA",
            salary: "$17K",
            timeUnit: "Mo",
            tags: ["Frontend Developer", "Full Time"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "google",
            logoBackgroundColor: Color.purple,
            jobTitle: "QA Engineer",
            location: "Denver, CO",
            salary: "$14K",
            timeUnit: "Mo",
            tags: ["QA Engineer", "Part Time"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "twitterIcon",
            logoBackgroundColor: Color.red,
            jobTitle: "UI Designer",
            location: "Los Angeles, CA",
            salary: "$16K",
            timeUnit: "Mo",
            tags: ["UI Designer", "Full Time"],
            isBookmarked: false
        ),
        Job(
            companyLogo: "facebookIcon",
            logoBackgroundColor: Color.green,
            jobTitle: "DevOps Engineer",
            location: "Boston, MA",
            salary: "$21K",
            timeUnit: "Mo",
            tags: ["DevOps Engineer", "Remote"],
            isBookmarked: false
        )
    ]
    
}
