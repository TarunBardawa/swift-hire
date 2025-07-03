//
//  Onboard.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Onboard: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("JobSpot")
                    .font(.title2)
                    .padding(.trailing)
            }
            Image(.onboard)
                .resizable()
                .scaledToFit()
                .frame(width: .infinity, height: 400)
            
            Spacer()
            
            Text("Find Your")
                .font(.title)
            Text("Dream Job")
                .font(.title)
                .foregroundStyle(.orange)
                .underline()
            Text("Here")
                .font(.title)
            
            Text("Explore all the most exciting job roles based on your interest and study major.")
                .foregroundStyle(.secondary)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
                .buttonStyle(.plain)
                .frame(width: 60, height: 60)
                .background(.darkBlue)
                .clipShape(.circle)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.viewBackground)
    }
}

#Preview {
    Onboard()
}
