//
//  BookmarkScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct BookmarkScreen: View {
    
    @StateObject private var viewModel = BookmarkViewModel()
    @State private var routerPath = RouterPath()
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            List {
                ForEach(viewModel.savedJobs) { job in
                    SavedJobCardView(job: job)
                        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Saved Jobs")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: .white, titleColor: .text)
        }
        .environment(routerPath)
    }
}


#Preview {
    BookmarkScreen()
}
