//
//  SeeAllRecentJobsScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct SeeAllRecentJobsScreen: View {
    
    @Environment(RouterPath.self) private var routerPath
    @StateObject private var viewModel = BookmarkViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.savedJobs) { job in
                JobCardView(job: job)
                    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                backButton()
            }
        }
    }
    
    private func backButton() -> some View {
        Button {
            routerPath.goBack()
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.text)
        }
    }
}


#Preview {
    SeeAllRecentJobsScreen()
}
