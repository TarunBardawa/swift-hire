//
//  SeeAllRecentJobsScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct SeeAllRecentJobsScreen: View {
    
    @Environment(RouterPath.self) private var routerPath
    @EnvironmentObject private var viewModel: HomeViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.recentJobs) { job in
                JobCardView(job: job)
                    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
            
            Spacer(minLength: AppLayout.tabBarHeight)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
        }
        .background(Color(.systemGray5))
        .listStyle(.plain)
        .navigationBarBackButtonHidden()
        .navigationBarColor(backgroundColor: Color(.systemGray5))
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
