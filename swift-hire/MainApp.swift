//
//  swift_hireApp.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 02/07/25.
//

import SwiftUI

@main
struct MainApp: App {
    
    @State private var showSplashScreen: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showSplashScreen {
                    SplashScreen()
                } else {
                    ContentView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.black)
//            .ignoresSafeArea()
            .task {
                guard showSplashScreen else { return }
                try? await Task.sleep(for: .seconds(0.5))
                withAnimation(.smooth(duration: 0.5)) {
                    showSplashScreen = false
                }
            }
        }
    }
}
