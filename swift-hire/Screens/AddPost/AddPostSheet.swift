//
//  AddPostSheet.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct AddPostSheet: View {
    var body: some View {
        VStack {
            Text("What would you like to add?")
                .font(.headline)
            
            Text("would you like to post your tips and experience or create a job?")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            AppButton(title: "POST") {
                
            }
            
            AppButton(title: "MAKE A JOB") {
                
            }
        }
        .padding()
    }
}
