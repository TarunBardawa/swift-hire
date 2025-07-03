//
//  Job.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Job: Identifiable {
    let id = UUID()
    let companyLogo: String // Image name or URL
    let logoBackgroundColor: Color
    let jobTitle: String
    let location: String
    let salary: String
    let timeUnit: String
    let tags: [String]
    let isBookmarked: Bool
}
