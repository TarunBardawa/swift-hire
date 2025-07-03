//
//  OfferView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct OfferView: View {
    var body: some View {
        ZStack() {
            Color.darkBlue
            HStack {
                VStack(alignment: .leading) {
                    Text("50% off\ntake any courses")
                        .font(.callout)
                        .foregroundStyle(.white)
                    
                    Button {
                        
                    } label: {
                        Text("Join Now")
                            .font(.subheadline)
                            .foregroundStyle(.white)
                    }
                    .padding(5)
                    .background(.orange)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }
                .padding(.leading)
                
                Spacer()
                
                Image(.offer)
                    .resizable()
                    .scaledToFit()
            }
        }
        .frame(height: 180)
        .frame(maxWidth: .infinity)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .listRowSeparator(.hidden)
        .listRowBackground(Color.clear)
    }
}
