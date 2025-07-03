//
//  HomeHeader.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Hello\nJohn Doe")
                .font(.title2)
                .foregroundStyle(.darkBlue)
            Spacer()
            Image(.userprofile)
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(.circle)
            
        }
        .background(Color(.systemGray5))
        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 10, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}
