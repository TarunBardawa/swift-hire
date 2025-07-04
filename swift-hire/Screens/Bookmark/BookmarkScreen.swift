//
//  BookmarkScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct BookmarkScreen: View {
    @EnvironmentObject private var viewModel: BookmarkViewModel
    @State private var routerPath = RouterPath()
    
    var body: some View {
        NavigationStack(path: $routerPath.path) {
            List {
                if !viewModel.savedJobs.isEmpty {
                    ForEach(viewModel.savedJobs) { job in
                        SavedJobCardView(job: job)
                            .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                } else {
                    EmptyBookmark()
                }
            }
            .listStyle(.plain)
            .navigationTitle("Saved Jobs")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: .white, titleColor: .text)
            .toolbar {
                if !viewModel.savedJobs.isEmpty {
                    ToolbarItem(placement: .topBarTrailing) {
                        deleteAllButton()
                    }
                }
            }
        }
        .environment(routerPath)
    }
    
    private func deleteAllButton() -> some View {
        Button(action: {
            withAnimation {
                viewModel.removeAllBookmarks()
            }
        }) {
            Text("Delete All")
                .foregroundColor(.red)
                .customFont(.medium, 15)
        }
    }
}

struct EmptyBookmark: View {
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "bookmark.slash")
                .foregroundStyle(.gray)
                .font(.system(size: 22))

            Text("No saved jobs")
                .customFont(.medium)
            
            Text("Your saved jobs will appear here")
                .foregroundStyle(.gray)
                .customFont(.regular, 15)
        }
        .frame(minHeight: 500)
        .vSpacing(.center)
        .hSpacing(.center)
        .listRowInsets(EdgeInsets(top: 12, leading: 16, bottom: 0, trailing: 16))
        .listRowBackground(Color.clear)
        .listRowSeparator(.hidden)
    }
}


#Preview {
    BookmarkScreen()
        .environmentObject(BookmarkViewModel())
}
