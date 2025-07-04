//
//  CompanyViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

@MainActor
class CompaniesViewModel: ObservableObject {
    @Published var companies: [Company] = [
        Company(logoName: "googleIcon", companyName: "Google Inc", followers: "1M Followers", isFollowed: false),
        Company(logoName: "dribbbleIcon", companyName: "Dribbble Inc", followers: "1M Followers", isFollowed: false),
        Company(logoName: "twitterIcon", companyName: "Twitter Inc", followers: "1M Followers", isFollowed: false),
        Company(logoName: "appleIcon", companyName: "Apple Inc", followers: "1M Followers", isFollowed: false),
        Company(logoName: "facebookIcon", companyName: "Facebook Inc", followers: "1M Followers", isFollowed: false),
        Company(logoName: "microsoftIcon", companyName: "Microsoft Inc", followers: "1M Followers", isFollowed: false),
        Company(logoName: "googleIcon", companyName: "Databricks", followers: "500K Followers", isFollowed: false),
        Company(logoName: "dribbbleIcon", companyName: "Groq", followers: "200K Followers", isFollowed: false),
        Company(logoName: "twitterIcon", companyName: "Deepgram", followers: "150K Followers", isFollowed: false),
        Company(logoName: "appleIcon", companyName: "Airwallex", followers: "300K Followers", isFollowed: false),
        Company(logoName: "facebookIcon", companyName: "AdsPower", followers: "100K Followers", isFollowed: false)
    ]
    
    func followCompany(_ company: Company) {
        if let index = companies.firstIndex(where: { $0.companyName == company.companyName }) {
            companies[index].isFollowed = !companies[index].isFollowed
        }
    }
}
