//
//  CustomTabBar.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 05/07/25.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabViewEnum
    @Binding var isSheetPresented: Bool
    var body: some View {
        HStack(spacing: 0) {
            TabButton(
                iconSelected: .homeSelect,
                iconUnselected: .homeUnSelect,
                isSelected: selectedTab == .home,
                action: {
                    withAnimation {
                        isSheetPresented = false
                        selectedTab = .home
                    }
                }
            )
            
            TabButton(
                iconSelected: .reconnectSelect,
                iconUnselected: .reconnectUnSelect,
                isSelected: selectedTab == .companies,
                action: {
                    withAnimation {
                        isSheetPresented = false
                        selectedTab = .companies
                    }
                }
            )
            
            AddButton(
                isSheetPresented: $isSheetPresented,
                action: { /*selectedTab = .add*/ }
            )
            .padding(.horizontal, 20)
            
            TabButton(
                iconSelected: .chatSelect,
                iconUnselected: .chatUnSelect,
                isSelected: selectedTab == .messages,
                action: {
                    withAnimation {
                        isSheetPresented = false
                        selectedTab = .messages
                    }
                }
            )
            
            TabButton(
                iconSelected: .bookmarkSelect,
                iconUnselected: .bookmarkUnSelect,
                isSelected: selectedTab == .bookmarks,
                action: {
                    withAnimation {
                        isSheetPresented = false
                        selectedTab = .bookmarks
                    }
                }
            )
        }
        .padding(.bottom)
        .frame(height: AppLayout.tabBarHeight)
        .background(Material.regular)
    }
}

#Preview {
    @Previewable @State var selectedTab = TabViewEnum.home
    @Previewable @State var isSheetPresented: Bool = false
    CustomTabBar(selectedTab: $selectedTab, isSheetPresented: $isSheetPresented)
}
