//
//  JobCardView.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct JobCardView: View {
    
    @EnvironmentObject var bookmarkVM: BookmarkViewModel
    
    let job: Job
    
    var isBookmarked: Bool {
        bookmarkVM.isBookmarked(job)
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(alignment: .top) {
                Image(job.companyLogo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 26)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(job.jobTitle)
                        .customFont(.semiBold)
                        .foregroundColor(Color(.label))
                    Text(job.location)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                
                Button {
                    bookmarkVM.addBookmark(job)
                } label: {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(.gray)
                }
                .buttonStyle(.plain)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: 4) {
                Text(job.salary)
                    .customFont(.semiBold)
                Text("/ \(job.timeUnit)")
                    .foregroundColor(.gray)
                    .customFont(.regular, 14)
            }
            
            HStack(spacing: 8) {
                ForEach(job.tags, id: \.self) { tag in
                    Text(tag)
                        .customFont(.regular, 14)
                        .padding(.horizontal, 12)
                        .lineLimit(1)
                        .allowsTightening(true)
                        .padding(.vertical, 6)
                        .background(Color(.systemGray6))
                        .cornerRadius(6)
                }
                Spacer()
                Button {
                    
                } label: {
                    Text("Apply")
                        .customFont(.regular, 14)
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
    }
    
    func isFavorite() -> Bool {
        // check in saved jobs viewModel
        return true
    }
}

#Preview {
    JobCardView(job: Job(
        companyLogo: "google.logo",
        jobTitle: "Software Engineer",
        location: "California, USA",
        salary: "$15K",
        timeUnit: "Mo",
        tags: ["Product Designer", "Full Time"]
    ))
}
