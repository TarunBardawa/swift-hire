//
//  Home.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var viewModel = HomeViewModel()
    @State private var routerPath = RouterPath()
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            VStack {
                List {
                    HeaderView()
                    
                    OfferView()
                        .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16))
                    
                    FindYourJobView()
                        .listRowInsets(EdgeInsets(top: 5, leading: 16, bottom: 0, trailing: 16))
                    
                    HStack {
                        Text("Recent Job List")
                            .font(.title3)
                            .foregroundStyle(.darkBlue)
                        
                        Spacer()
                        
                        Button {
                            routerPath.navigate(to: .recentJobs)
                        } label: {
                            Text("See More")
                                .font(.title3)
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
                    
                    Spacer(minLength: 30)
                        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
                .withAppRouter()
                .navigationBarColor(backgroundColor: Color(.systemGray5), titleColor: .text)
            }
            .background(Color(.systemGray5))
        }
        .environment(routerPath)
    }
}

#Preview {
    Home()
}
