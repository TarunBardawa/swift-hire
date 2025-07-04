//
//  LoginScreen.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct LoginScreen: View {
    
    @Environment(RouterPath.self) private var routerPath
    @EnvironmentObject var authProvider: AuthProvider
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var rememberMe: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 8) {
                Text("Welcome Back")
                    .font(.largeTitle)
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit nsed do eiusmod tempor")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 30)
            }
            .padding(.top, 40)
            .padding(.bottom, 20)
            
            VStack(spacing: 16) {
                CustomTextField(title: "Email", placeholder: "Email Address", text: $email)
                CustomTextField(title: "Password", placeholder: "Password", text: $password, isSecure: true)
                
                HStack {
                    Toggle("", isOn: $rememberMe)
                        .toggleStyle(CheckboxStyle(label: "Remember me"))
                    
                    Spacer()
                    
                    Button("Forgot Password?") {
                        
                    }
                    .font(.system(size: 16))
                    .foregroundColor(.darkBlue)
                    .buttonStyle(.plain)
                }
            }
            .padding(.horizontal, 24)
            
            AppButton(title: "LOGIN") {
                UserDefaults.sharedDefaults.set(true, forKey: "isLoggedIn")
                withAnimation {
                    authProvider.authState = .loggedIn
                }
            }
            .padding(.horizontal, 24)
            .padding(.top)
            
            Button {
                
            } label: {
                HStack {
                    Image(.google)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("SIGN IN WITH GOOGLE")
                        .font(.subheadline)
                }
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity)
                .padding()
                .background(.white)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.2))
                )
                .clipShape(.capsule)
                
            }
            .padding(.horizontal, 24)
            
            HStack {
                Text("You don't have an account yet?")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Button {
                    
                } label: {
                    Text("Sign Up")
                        .font(.caption)
                        .foregroundColor(.textColorYellow)
                        .underline()
                }
                .buttonStyle(.plain)
            }
            .padding(.top, 8)
            
            Spacer()
        }
        .background(.viewBackground)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginScreen()
}
