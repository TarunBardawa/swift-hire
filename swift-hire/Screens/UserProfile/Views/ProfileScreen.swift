//
//  Profile.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 05/07/25.
//

import SwiftUI
import WrappingStack

struct ProfileScreen: View {
    @Environment(RouterPath.self) private var routerPath
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                VStack {
                    ProgressView()
                        .tint(.darkBlue)
                        .controlSize(.large)
                }
                .vSpacing(.center)
                .hSpacing(.center)
                .frame(height: UIScreen.screenHeight - AppLayout.tabBarHeight)
            } else if let user = viewModel.user {
                LazyVStack(spacing: 0) {
                    ProfileHeader(user: user)
                        .padding(.bottom, 16)
                    
                    profileSection(title: "About Me", icon: .aboutMe) {
                        Text(user.aboutMe)
                            .foregroundColor(.gray)
                            .customFont(.medium)
                    }
                    
                    profileSection(title: "Work Experience", icon: .workExperience) {
                        experienceView
                    }
                    
                    profileSection(title: "Education", icon: .education) {
                        educationView
                    }
                    
                    profileSection(title: "Languages", icon: .language) {
                        tagsView(items: user.languages)
                    }
                    
                    profileSection(title: "Appreciations", icon: .appreciation) {
                        appreciationsView
                    }
                    
                    profileSection(title: "Skills", icon: .skill) {
                        tagsView(items: user.skills.prefix(5).map { $0 })
                    }
                    
                    profileSection(title: "Resume", icon: .resume) {
                        HStack {
                            Image(.pdf)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                            Text(user.resume)
                                .foregroundColor(.blue)
                        }
                    }
                    
                    Spacer(minLength: 30)
                }
                .padding()
            } else {
                EmptyView()
            }
        }
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden()
        .navigationBarColor(backgroundColor: Color(.systemGray6))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                backButton
            }
        }
//        .onAppear {
//            Task { await viewModel.fetchUserProfile() }
//        }
    }
    
    // MARK: - Subviews
    
    private var backButton: some View {
        Button {
            routerPath.goBack()
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.text)
        }
    }
    
    private var experienceView: some View {
        ForEach(viewModel.user?.workExperience ?? []) { exp in
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(exp.title)
                        .customFont(.semiBold, 14)
                    Spacer()
                    Image(.editOrange)
                }
                Text(exp.company)
                    .foregroundColor(.gray)
                    .customFont(.medium, 14)
                Text("\(exp.period) • \(exp.duration)")
                    .foregroundColor(.gray)
                    .customFont(.regular, 12)
            }
            .padding(.vertical, 4)
        }
    }
    
    private var educationView: some View {
        ForEach(viewModel.user?.education ?? []) { edu in
            VStack(alignment: .leading, spacing: 4) {
                Text(edu.degree)
                    .customFont(.semiBold, 14)
                Text(edu.institution)
                    .foregroundColor(.gray)
                    .customFont(.medium)
                Text(edu.year)
                    .foregroundColor(.gray)
                    .customFont(.regular, 12)
            }
            .padding(.vertical, 4)
        }
    }
    
    private var appreciationsView: some View {
        ForEach(viewModel.user?.appreciations ?? [], id: \.id) { app in
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(app.provider)
                        .customFont(.semiBold, 14)
                    Spacer()
                    Image(.editOrange)
                }
                Text(app.title)
                    .foregroundColor(.gray)
                    .customFont(.medium)
                Text(app.year)
                    .foregroundColor(.gray)
                    .customFont(.regular, 12)
            }
            .padding(.vertical, 4)
        }
    }
    
    private func tagsView(items: [String]) -> some View {
        WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
            ForEach(items, id: \.self) { item in
                Text(item)
                    .foregroundStyle(.textColor2)
                    .customFont(.medium, 14)
                    .padding([.horizontal, .vertical], 12)
                    .background(Color(.systemGray6))
                    .clipShape(.capsule)
            }
        }
    }
    
    // MARK: - Helper Functions
    
    private func profileSection<Content: View>(title: String, icon: ImageResource, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            ProfileSectionCard(
                icon: icon,
                title: title,
                content: AnyView(content())
            )
            .cornerRadius(12, corners: .allCorners)
            .padding(.horizontal, 5)
            .padding(.vertical, 8)
            
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
            .environment(RouterPath())
    }
}

