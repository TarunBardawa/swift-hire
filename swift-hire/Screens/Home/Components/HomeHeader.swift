//
//  HomeHeader.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct HeaderView: View {
    
    var userName: String
    var onProfileTap: (() -> Void)?
    
    var body: some View {
        HStack {
            Text("Hello\n\(userName)")
                .customFont(.medium, 20)
                .foregroundStyle(.darkBlue)
            Spacer()
            
            Image(.userprofile)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)
                .contentShape(.rect)
                .onTapGesture {
                    onProfileTap?()
                }
        }
        .background(Color(.systemGray5))
        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 10, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}
