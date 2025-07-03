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
            Text("Hello\nTarun Bardawa")
                .font(.title2)
                .foregroundStyle(.darkBlue)
            Spacer()
            Image(.avatar)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .clipShape(.circle)
            
        }
        .listRowSeparator(.hidden)
    }
}
