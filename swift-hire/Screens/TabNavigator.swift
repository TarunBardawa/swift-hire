//
//  TabNavigator.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct TabNavigator: View {
    
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Home()
                .tabItem {
                    Image(selectedTab == 0 ? .homeSelect : .homeUnSelect)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .tag(0)
            
            Companies()
                .tabItem {
                    Image(selectedTab == 1 ? .reconnectSelect : .reconnectUnSelect)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .tag(1)
            
            AddPost()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                        .padding(.top)
                }
                .tag(2)
            
            MessagesScreen()
                .tabItem {
                    Image(selectedTab == 3 ? .chatSelect : .chatUnSelect)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .tag(3)
            
            BookmarkScreen()
                .tabItem {
                    Image(selectedTab == 4 ? .bookmarkSelect : .bookmarkUnSelect)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                }
                .tag(4)
        }
        .tint(.orange)
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
}

#Preview {
    TabNavigator()
}
