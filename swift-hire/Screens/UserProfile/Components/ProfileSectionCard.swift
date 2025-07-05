//
//  ProfileSectionCard.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 05/07/25.
//

import SwiftUI

struct ProfileSectionCard: View {
    let icon: ImageResource
    let title: String
    let content: AnyView

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(icon)
                
                Text(title)
                    .customFont(.semiBold)
                Spacer()
                Circle()
                    .fill(Color.orange.opacity(0.15))
                    .frame(width: 28, height: 28)
                    .overlay(
                        Image(systemName: "plus")
                            .foregroundColor(.orange)
                    )
            }
            
            Divider()
                .padding(.vertical, 4)
            
            content
        }
        .padding()
        .background(Color.white)
    }
}
