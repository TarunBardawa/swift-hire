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
        Company(logoName: "google_logo", companyName: "Google Inc", followers: "1M Followers"),
        Company(logoName: "dribbble_logo", companyName: "Dribbble Inc", followers: "1M Followers"),
        Company(logoName: "twitter_logo", companyName: "Twitter Inc", followers: "1M Followers"),
        Company(logoName: "apple_logo", companyName: "Apple Inc", followers: "1M Followers"),
        Company(logoName: "facebook_logo", companyName: "Facebook Inc", followers: "1M Followers"),
        Company(logoName: "microsoft_logo", companyName: "Microsoft Inc", followers: "1M Followers"),
    ]
}
