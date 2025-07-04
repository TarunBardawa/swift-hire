//
//  AuthProvider.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 04/07/25.
//

import SwiftUI
import Combine

@MainActor
class AuthProvider: ObservableObject {
    @Published var authState: AuthState = AuthState.loggedOut
    
    init() {
        autoLogin()
    }
    
    func autoLogin() {
        if UserDefaults.sharedDefaults.bool(forKey: "isLoggedIn") == true {
            self.authState = .loggedIn
        }
    }
    
}

enum AuthState {
    case pending
    case loggedIn
    case loggedOut
}
