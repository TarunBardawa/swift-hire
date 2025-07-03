//
//  ContentView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 02/07/25.
//

import SwiftUI

struct AppRoot: View {
    
    @EnvironmentObject var authProvider: AuthProvider
    @State var routerPath = RouterPath()
    
    var body: some View {
        switch authProvider.authState {
        case .pending:
            ZStack {
                Color.bg
                ProgressView()
                    .controlSize(.large)
                    .tint(.white)
            }
            .ignoresSafeArea()
        case .loggedIn:
            TabNavigator()
                .transition(CustomTransition())
            
        case .loggedOut:
            NavigationStack(path: $routerPath.path) {
                Onboard()
                    .withAppRouter()
            }
            .environment(routerPath)
        }
    }
}

struct CustomTransition: Transition {
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .offset(x: offset(for: phase))
    }

    private func offset(for phase: TransitionPhase) -> CGFloat {
        let width = screenSize.width
        if phase.isIdentity {
            return 0
        } else {
            return width
        }
    }

    var screenSize: CGSize {
        if let screenSize = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size {
            return screenSize
        }
        return .zero
    }
}

#Preview {
    AppRoot()
}
