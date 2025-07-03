//
//  Onboard.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Onboard: View {
    
    @Environment(RouterPath.self) private var routerPath
    
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
                .frame(height: 380)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            Text("Find Your")
                .font(.largeTitle)
            Text("Dream Job")
                .font(.largeTitle)
                .foregroundStyle(.orange)
                .underline()
            Text("Here!")
                .font(.largeTitle)
            
            Text("Explore all the most exciting job roles based on your interest and study major.")
                .foregroundStyle(.secondary)
                .padding(.top, 1)
            
            HStack {
                Spacer()
                
                Button {
                    routerPath.navigate(to: .login)
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
