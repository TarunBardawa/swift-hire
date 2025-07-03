//
//  ContentView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 02/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var routerPath = RouterPath()
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            Onboard()
                .withAppRouter()
        }
        .environment(routerPath)
    }
}

#Preview {
    ContentView()
}
