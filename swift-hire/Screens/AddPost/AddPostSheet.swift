//
//  AddPostSheet.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct AddPostSheet: View {
    var body: some View {
        ScrollView {
            Text("What would you like to add?")
                .font(.headline)
            
            Text("would you like to post your tips and experience or create a job?")
                .font(.subheadline)
                .multilineTextAlignment(.center)
            
            AppButton(title: "POST") {
                
            }
            
            AppButton(title: "MAKE A JOB", backgroundColor: .lightPurple) {
                
            }
        }
        .padding()
    }
}
