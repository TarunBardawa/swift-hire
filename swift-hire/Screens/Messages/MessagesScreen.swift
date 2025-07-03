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
            Image(systemName: "envelope")
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text("No Messages")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            Text("You currently have no incoming messages")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Button {
                
            } label: {
                Text("CREATE A MESSAGE")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.darkBlue)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
            .padding(.top, 40)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    MessagesScreen()
}
