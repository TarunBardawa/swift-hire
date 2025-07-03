//
//  AddPost.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct AddPost: View {
    
    @State private var showBottomSheet: Bool = false
    
    var body: some View {
        VStack {
            Text("")
        }
        .sheet(isPresented: $showBottomSheet) {
            AddPostSheet()
                .presentationDetents([.fraction(0.40)])
                .presentationDragIndicator(.visible)
        }
        .onAppear {
            showBottomSheet = true
        }
    }
}
