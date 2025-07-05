//
//  AppRegistry.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

@MainActor
extension View {
  func withAppRouter() -> some View {
    navigationDestination(for: RouterDestination.self) { destination in
      switch destination {
      case .onboarding:
          Onboard()
      case .login:
          LoginScreen()
      case .loggedIn:
//          TabNavigator()
          CustomTabNavigator()
              .toolbarVisibility(.hidden, for: .navigationBar)
      case .recentJobs:
          SeeAllRecentJobsScreen()
      case .profile:
          ProfileScreen()
      }
    }
  }
}
