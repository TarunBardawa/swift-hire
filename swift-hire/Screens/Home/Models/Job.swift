//
//  Job.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Job: Identifiable, Codable {
    let id = UUID()
    let companyLogo: String
    let jobTitle: String
    let location: String
    let salary: String
    let timeUnit: String
    let tags: [String]
    
    enum CodingKeys: String, CodingKey {
        case companyLogo
        case jobTitle
        case location
        case salary
        case timeUnit
        case tags
    }
}
