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
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.top, 12)
            
            Text(company.companyName)
                .customFont(.semiBold)
                .lineLimit(1)
            
            Text(company.followers)
                .foregroundColor(.gray)
                .customFont(.regular, 15)
                .lineLimit(1)
            
            Button {
                
            } label: {
                Text("Follow")
                    .customFont(.regular, 15)
                    .padding(.vertical, 5)
                    .frame(maxWidth: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(.purple, lineWidth: 1)
                    )
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 2)
    }
}


#Preview {
    CompanyCardView(company: Company(logoName: "google_logo", companyName: "Google Inc", followers: "1M Followers"))
}
