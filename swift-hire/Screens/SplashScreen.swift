//
//  SplashScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 02/07/25.
//

import SwiftUI

struct SplashScreen: View {
    
    var body: some View {
        VStack(spacing: 0) {
            Image(.logo)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            Text("Jobspot")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.darkBlue)
    }
}

#Preview {
    SplashScreen()
}
