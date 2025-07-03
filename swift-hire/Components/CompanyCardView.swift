//
//  CompanyCardView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct CompanyCardView: View {
    let company: Company

    var body: some View {
        VStack(spacing: 12) {
            Image(company.logoName)
                .resizable()
                .scaledToFit()
                .frame(width: 56, height: 56)
                .background(.black.opacity(0.1))
                .clipShape(Circle())
                .padding(.top, 12)
            
            Text(company.companyName)
                .font(.headline)
                .foregroundColor(.black)
                .lineLimit(1)
            
            Text(company.followers)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(1)
            
            Button {
                
            } label: {
                Text("Follow")
                    .font(.system(size: 17, weight: .medium))
                    .foregroundColor(.text)
                    .padding(.vertical, 10)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.purple, lineWidth: 1)
                    )
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}


#Preview {
    CompanyCardView(company: Company(logoName: "google_logo", companyName: "Google Inc", followers: "1M Followers"))
}
