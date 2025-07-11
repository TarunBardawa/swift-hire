//
//  SavedJobCardView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct SavedJobCardView: View {
    
    let job: Job
    var removeBookmark: ((Job) -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .center) {
                Image(job.companyLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                    .clipShape(.circle)
                    .padding(.leading)
                
                Spacer()
                
                Menu {
                    Button(role: .destructive) {
                        removeBookmark?(job)
                    } label: {
                        Label("Remove", systemImage: "bookmark.slash")
                    }
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                        .rotationEffect(.degrees(90))
                        .padding()
                }
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(job.jobTitle)
                    .customFont(.medium)
                Text(job.location)
                    .foregroundColor(.gray)
                    .customFont(.regular, 15)
            }
            .padding(.horizontal)
            
            HStack(spacing: 8) {
                ForEach(job.tags, id: \.self) { tag in
                    Text(tag)
                        .customFont(.regular, 14)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .lineLimit(1)
                        .allowsTightening(true)
                        .background(Color(.systemGray6))
                        .clipShape(.capsule)
                }
            }
            .padding(.horizontal)
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text("1 week ago")
                    .foregroundColor(Color(.systemGray))
                    .customFont(.regular, 14)
                
                Spacer()
                
                Text(job.salary)
                    .customFont(.medium, 14)
                Text("/ \(job.timeUnit)")
                    .foregroundColor(.gray)
                    .customFont(.medium, 13)
            }
            .padding(.horizontal)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color(.black).opacity(0.1), radius: 4, x: 0, y: 4)
        .shadow(color: Color(.black).opacity(0.1), radius: 4, x: 0, y: -4)
    }
}

#Preview {
    SavedJobCardView(job: Job(
        companyLogo: "google.logo",
        jobTitle: "Software Engineer",
        location: "California, USA",
        salary: "$15K",
        timeUnit: "Mo",
        tags: ["Product Designer", "Full Time"]
    ))
}
