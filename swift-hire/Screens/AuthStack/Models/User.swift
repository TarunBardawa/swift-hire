//
//  User.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 04/07/25.
//

import SwiftUI

struct User: Codable, Hashable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
