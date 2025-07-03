//
//  Home.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Home: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
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
                    
                } label: {
                    Text("See More")
                        .font(.title3)
                }
            }
            .listRowSeparator(.hidden)
            
            ForEach(viewModel.recentJobs) { job in
                JobCardView(job: job)
                    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}

#Preview {
    Home()
}
