//
//  Home.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var bookmarkVM: BookmarkViewModel
    @StateObject private var viewModel = HomeViewModel()
    @State private var routerPath = RouterPath()
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .tint(.darkBlue)
                        .controlSize(.large)
                        .hSpacing(.center)
                } else {
                    List {
                        HeaderView(userName: viewModel.user?.name ?? "User") {
                            routerPath.navigate(to: .profile)
                        }
                        
                        OfferView()
                            .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16))
                        
                        FindYourJobView(summary: viewModel.summary)
                            .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16))
                        
                        HStack {
                            Text("Recent Job List")
                                .customFont(.medium, 17)
                                .foregroundStyle(.darkBlue)
                            
                            Spacer()
                            
                            Button {
                                routerPath.navigate(to: .recentJobs)
                            } label: {
                                Text("See More")
                                    .customFont(.medium, 17)
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        
                        
                        ForEach(viewModel.recentJobs) { job in
                            JobCardView(job: job)
                                .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 5, trailing: 16))
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                        }
                        
                        
                        
                        Spacer(minLength: AppLayout.tabBarHeight)
                            .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                    .listStyle(.plain)
                }
                
            }
            .vSpacing(.center)
            .background(Color(.systemGray5))
            .withAppRouter()
            .navigationBarColor(backgroundColor: Color(.systemGray5))
        }
        .environment(routerPath)
        .environmentObject(viewModel)
    }
}

#Preview {
    Home()
}
