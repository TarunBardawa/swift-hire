//
//  HomeViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var recentJobs: [Job] = []
    
    init() {
        getRecentJobs()
    }
    
    func getRecentJobs() {
        recentJobs = [
            Job(
                companyLogo: "googleIcon",
                jobTitle: "Product Designer",
                location: "California, USA",
                salary: "$15K",
                timeUnit: "Mo",
                tags: ["Product Designer", "Full Time"]
            ),
            Job(
                companyLogo: "dribbbleIcon",
                jobTitle: "Software Engineer",
                location: "Redmond, WA",
                salary: "$18K",
                timeUnit: "Mo",
                tags: ["Software Engineer", "Full Time"]
            ),
            Job(
                companyLogo: "twitterIcon",
                jobTitle: "Data Scientist",
                location: "Austin, TX",
                salary: "$20K",
                timeUnit: "Mo",
                tags: ["Data Scientist", "Contract"]
            ),
            Job(
                companyLogo: "facebookIcon",
                jobTitle: "UX Designer",
                location: "Seattle, WA",
                salary: "$16K",
                timeUnit: "Mo",
                tags: ["UX Designer", "Full Time"]
            ),
            Job(
                companyLogo: "appleIcon",
                jobTitle: "iOS Developer",
                location: "Cupertino, CA",
                salary: "$22K",
                timeUnit: "Mo",
                tags: ["iOS Developer", "Full Time"]
            ),
            Job(
                companyLogo: "dribbbleIcon",
                jobTitle: "Backend Engineer",
                location: "New York, NY",
                salary: "$19K",
                timeUnit: "Mo",
                tags: ["Backend Engineer", "Contract"]
            ),
            Job(
                companyLogo: "linkedin",
                jobTitle: "Frontend Developer",
                location: "San Francisco, CA",
                salary: "$17K",
                timeUnit: "Mo",
                tags: ["Frontend Developer", "Full Time"]
            ),
            Job(
                companyLogo: "google",
                jobTitle: "QA Engineer",
                location: "Denver, CO",
                salary: "$14K",
                timeUnit: "Mo",
                tags: ["QA Engineer", "Part Time"]
            ),
            Job(
                companyLogo: "twitterIcon",
                jobTitle: "UI Designer",
                location: "Los Angeles, CA",
                salary: "$16K",
                timeUnit: "Mo",
                tags: ["UI Designer", "Full Time"]
            ),
            Job(
                companyLogo: "facebookIcon",
                jobTitle: "DevOps Engineer",
                location: "Boston, MA",
                salary: "$21K",
                timeUnit: "Mo",
                tags: ["DevOps Engineer", "Remote"]
            )
        ]
    }
    
}
