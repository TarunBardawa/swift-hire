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
        Company(logoName: "googleIcon", companyName: "Google Inc", followers: "1M Followers"),
        Company(logoName: "dribbbleIcon", companyName: "Dribbble Inc", followers: "1M Followers"),
        Company(logoName: "twitterIcon", companyName: "Twitter Inc", followers: "1M Followers"),
        Company(logoName: "appleIcon", companyName: "Apple Inc", followers: "1M Followers"),
        Company(logoName: "facebookIcon", companyName: "Facebook Inc", followers: "1M Followers"),
        Company(logoName: "microsoftIcon", companyName: "Microsoft Inc", followers: "1M Followers"),
        Company(logoName: "googleIcon", companyName: "Databricks", followers: "500K Followers"),
        Company(logoName: "dribbbleIcon", companyName: "Groq", followers: "200K Followers"),
        Company(logoName: "twitterIcon", companyName: "Deepgram", followers: "150K Followers"),
        Company(logoName: "appleIcon", companyName: "Airwallex", followers: "300K Followers"),
        Company(logoName: "facebookIcon", companyName: "AdsPower", followers: "100K Followers")
    ]

}
