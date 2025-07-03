//
//  FindYourJobView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct FindYourJobView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 18) {
            Text("Find Your Job")
                .font(.title3)
                .padding(.leading, 5)
            
            HStack(spacing: 16) {
                JobTypeCard(
                    color: Color(red: 0.75, green: 0.93, blue: 1.0),
                    iconName: "doc.text.magnifyingglass",
                    count: "44.5K",
                    title: "Remote Job"
                )
                VStack(spacing: 8) {
                    JobTypeCard(
                        color: Color(red: 0.82, green: 0.78, blue: 1.0),
                        iconName: nil,
                        count: "66.8k",
                        title: "Full Time"
                    )
                    JobTypeCard(
                        color: Color(red: 1.0, green: 0.89, blue: 0.74),
                        iconName: nil,
                        count: "38.9k",
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
    let iconName: String?
    let count: String
    let title: String

    var body: some View {
        VStack(spacing: 8) {
            if let icon = iconName {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 36, height: 36)
                    .foregroundColor(.gray)
            }
            Text(count)
                .font(.title)
                .bold()
                .foregroundColor(.black)
            Text(title)
                .font(.headline)
                .foregroundColor(.black.opacity(0.7))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
        .cornerRadius(8)
    }
}

#Preview {
    FindYourJobView()
}
