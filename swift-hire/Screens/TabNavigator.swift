//
//  TabNavigator.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct TabNavigator: View {
    
    @StateObject private var bookmarkVM = BookmarkViewModel()
    
    enum Tab: Int {
        case home, companies, messages, bookmarks
    }
    
    @State private var selectedTab: Tab = .home
    @State private var isSheetPresented = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case .home:
                    Home()
                case .companies:
                    Companies()
//                case .add:
//                    EmptyView()
                case .messages:
                    MessagesScreen()
                case .bookmarks:
                    BookmarkScreen()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, tabBarHeight)
            
            // Bottom sheet (positioned behind the tab bar)
            if isSheetPresented {
                BottomSheetView(isPresented: $isSheetPresented)
                    .transition(.move(edge: .bottom))
                    .zIndex(0) // Behind the tab bar
            }
            
            VStack {
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
            }
            .frame(height: tabBarHeight)
            .background(Material.regular)
            .zIndex(1)
        }
        .ignoresSafeArea(edges: .bottom)
        .environmentObject(bookmarkVM)
        .navigationBarColor(backgroundColor: .bgMainView)
    }
    
    private var tabBarHeight: CGFloat {
        let keyWindow = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        return 50 + (keyWindow?.safeAreaInsets.bottom ?? 0)
    }
}

struct TabButton: View {
    let iconSelected: ImageResource
    let iconUnselected: ImageResource
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(isSelected ? iconSelected : iconUnselected)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct AddButton: View {
    @Binding var isSheetPresented: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                isSheetPresented.toggle()
                action()
            }
        } label: {
            Image(systemName: "plus")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 30, height: 30)
                .background(Circle().fill(Color.darkBlue))
                .rotationEffect(.degrees(isSheetPresented ? 45 : 0))
                .shadow(radius: 5)
        }
    }
}

struct BottomSheetView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        AddPostSheet()
    }
}

#Preview {
    TabNavigator()
}
