//
//  FindYourJobView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct FindYourJobView: View {
    
    let summary: Summary?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Find Your Job")
                .customFont(.medium, 17)
                .padding(.leading, 5)
            
            HStack(spacing: 16) {
                JobTypeCard(
                    color: Color(red: 0.75, green: 0.93, blue: 1.0),
                    iconName: .remoteJobs,
                    count: "\(summary?.remote ?? "0")",
                    title: "Remote Job"
                )
                VStack(spacing: 8) {
                    JobTypeCard(
                        color: Color(red: 0.82, green: 0.78, blue: 1.0),
                        iconName: nil,
                        count: "\(summary?.fullTime ?? "0")",
                        title: "Full Time"
                    )
                    JobTypeCard(
                        color: Color(red: 1.0, green: 0.89, blue: 0.74),
                        iconName: nil,
                        count: "\(summary?.partTime ?? "0")",
                        title: "Part Time"
                    )
                }
            }
        }
        .frame(height: 250)
        .padding(.vertical)
        .background(Color(.systemGray5))
        .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

struct JobTypeCard: View {
    let color: Color
    let iconName: ImageResource?
    let count: String
    let title: String

    var body: some View {
        VStack(spacing: 8) {
            if let icon = iconName {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.gray)
            }
            Text(count)
                .customFont(.medium)
            Text(title)
                .customFont(.regular)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .cornerRadius(8)
    }
}
