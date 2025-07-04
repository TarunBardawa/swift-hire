//
//  AuthStack.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 04/07/25.
//

import SwiftUI

struct AuthStack: View {
    
    @State var routerPath = RouterPath()
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            Onboard()
                .withAppRouter()
        }
        .environment(routerPath)
    }
}
