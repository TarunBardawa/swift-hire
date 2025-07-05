//
//  CustomTabNavigator.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 05/07/25.
//

import SwiftUI

struct CustomTabNavigator: View {
    
    @StateObject private var bookmarkVM = BookmarkViewModel()
    
    @State private var selectedTab: TabViewEnum = .home
    @State private var isHidden = false
    
    @State private var isSheetPresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                ForEach(TabViewEnum.allCases) { tab in
                    let tabItem = tab.tabItem
                    Tab(
                        tabItem.name,
                        systemImage: tabItem.systemImage,
                        value: tab) {
                            tab
                                .toolbarVisibility(.hidden, for: .tabBar)
                        }
                }
            }
            if isSheetPresented {
                BottomSheetView(isPresented: $isSheetPresented)
                    .transition(.move(edge: .bottom))
                    .zIndex(0)
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .safeAreaInset(edge: .bottom) {
            CustomTabBar(selectedTab: $selectedTab, isSheetPresented: $isSheetPresented)
        }
        .environmentObject(bookmarkVM)
    }
}

#Preview {
    CustomTabNavigator()
}

@Observable
class Router {
    var selectedTab: TabViewEnum = .home
}
