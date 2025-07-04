//
//  ProfileHeader.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 05/07/25.
//

import SwiftUI

struct ProfileHeader: View {
    
    let user: UserProfile
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            RoundedRectangle(cornerRadius: 12)
                .fill(LinearGradient(
                    colors: [.darkBlue, .gradient2],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .frame(height: 220)
            
            VStack(alignment: .leading, spacing: 12) {
                HStack(alignment: .top) {
                    Image(.userprofile) //user.profileImage
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 68, height: 68)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .foregroundColor(.white)
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.white)
                }
                VStack(alignment: .leading, spacing: 2) {
                    Text(user.name)
                        .foregroundColor(.white)
                        .customFont(.semiBold, 18)
                    Text(user.location)
                        .foregroundColor(.white.opacity(0.85))
                        .customFont(.regular, 15)
                }
                
                HStack(spacing: 10) {
//                    Spacer()
                    Text("\(user.followers) Followers")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.85))
                    Text("\(user.following) Following")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.85))
                    
                    Button {
                        // Edit profile action
                    } label: {
                        HStack {
                            Text("Edit profile")
                                .foregroundStyle(.white)
                                .customFont(.regular, 12)
                                .lineLimit(1)
                            Image(systemName: "pencil")
                        }
                        .font(.footnote)
                        .padding(.horizontal, 14)
                        .padding(.vertical, 6)
                        .background(Color.white.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    }
                    .buttonStyle(.plain)
                    .frame(minWidth: 120)
                }
                .hSpacing(.trailing)
            }
            .padding(.vertical, 30)
            .padding(.horizontal)
        }
    }
}

#Preview {
    ProfileHeader(user: mockUser)
}
