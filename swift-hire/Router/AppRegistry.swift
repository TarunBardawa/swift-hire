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
          TabNavigator()
              .toolbarVisibility(.hidden, for: .navigationBar)
      }
    }
  }
}
