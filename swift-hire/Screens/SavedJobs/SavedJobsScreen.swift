//
//  SavedJobsScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct SavedJobsScreen: View {
    
    @StateObject private var viewModel = SavedJobsViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.savedJobs) { job in
                SavedJobCardView(job: job)
                    .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
    }
}


#Preview {
    SavedJobsScreen()
}
