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
            VStack(spacing: 12) {
                Text("What would you like to add?")
                    .customFont(.semiBold, 18)
                
                Text("would you like to post your tips and experience or create a job?")
                    .foregroundStyle(.gray)
                    .customFont(.regular)
                    .multilineTextAlignment(.center)
                
                AppButton(title: "POST") {
                    
                }
                
                AppButton(title: "MAKE A JOB", backgroundColor: .lightPurple) {
                    
                }
            }
            .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 400)
        .background(Color.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
        .shadow(radius: 10)
        .edgesIgnoringSafeArea(.bottom)
    }
}
