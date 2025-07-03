//
//  JobCardView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct JobCardView: View {
    
    let job: Job

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                ZStack {
                    Circle()
                        .fill(.black.opacity(0.1))
                        .frame(width: 44, height: 44)
                    Image(job.companyLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 26, height: 26)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(job.jobTitle)
                        .font(.headline)
                        .foregroundColor(Color(.label))
                    Text(job.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Image(systemName: job.isBookmarked ? "bookmark.fill" : "bookmark")
                    .foregroundColor(.gray)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(job.salary)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.label))
                Text("/ \(job.timeUnit)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            HStack(spacing: 8) {
                ForEach(job.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.subheadline)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(.systemGray6))
                        .cornerRadius(6)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Apply")
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundColor(Color(.label))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 8)
                        .background(Color(.systemOrange).opacity(0.18))
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color(.black).opacity(0.1), radius: 4, x: 0, y: 4)
        .shadow(color: Color(.black).opacity(0.1), radius: 4, x: 0, y: -4)
//        .padding()
    }
}

#Preview {
    JobCardView(job: Job(
        companyLogo: "google.logo",
        logoBackgroundColor: Color.yellow,
        jobTitle: "Software Engineer",
        location: "California, USA",
        salary: "$15K",
        timeUnit: "Mo",
        tags: ["Product Designer", "Full Time"],
        isBookmarked: false
    ))
}
