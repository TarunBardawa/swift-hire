//
//  MessagesScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct MessagesScreen: View {
    var body: some View {
        VStack(spacing: 12) {
            
            Image(.noChat)
            
            Text("No Messages")
                .customFont(.semiBold, 18)
            
            Text("You currently have no incoming messages")
                .foregroundColor(.secondary)
                .customFont(.regular, 15)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            AppButton(title: "CREATE A MESSAGE", action: {
                
            })
            .padding(.top, 40)
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
    }
}

#Preview {
    MessagesScreen()
}
