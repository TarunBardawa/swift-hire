//
//  CustomTextField.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct CustomTextField: View {
    var title: String
    var placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .foregroundColor(.gray)
                .font(.customFont(.medium, 16))
            
            if isSecure {
                SecureField(placeholder, text: $text)
                    .font(.customFont(.regular, 16))
                    .padding()
                    .background(.white)
                    .textInputAutocapitalization(.never)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                TextField(placeholder, text: $text)
                    .font(.customFont(.regular, 16))
                    .padding()
                    .background(.white)
                    .textInputAutocapitalization(.never)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    CustomTextField(title: "Email", placeholder: "Email Address", text: .constant("Email"), isSecure: false)
}
