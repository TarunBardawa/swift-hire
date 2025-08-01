//
//  Company.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Company: Identifiable, Codable {
    let id = UUID()
    let logoName: String
    let companyName: String
    let followers: String
    var isFollowed: Bool
    
    enum CodingKeys: String, CodingKey {
        case logoName
        case companyName
        case followers
        case isFollowed
    }
}
