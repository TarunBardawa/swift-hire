//
//  TabViewEnum.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 05/07/25.
//

import SwiftUI

struct TabItem {
    let name: String
    let systemImage: String
    var color: Color
}

enum TabViewEnum: Identifiable, CaseIterable, View {
    case home, companies, messages, bookmarks
    var id: Self { self }
    
    var tabItem: TabItem {
        switch self {
            case .home:
                    .init(name: "Home", systemImage: "house", color: .blue)
            case .companies:
                    .init(name: "Companies", systemImage: "wineglass", color: .purple)
            
            case .messages:
                    .init(name: "Messages", systemImage: "info", color: .green)
            case .bookmarks:
                    .init(name: "Bookmarks", systemImage: "map", color: .orange)
        }
    }
    
    var body: some View {
        switch self {
            case .home:
                Home()
            case .companies:
                Companies()
            case .messages:
                MessagesScreen()
            case .bookmarks:
                BookmarkScreen()
        }
    }
}
