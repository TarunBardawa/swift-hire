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
    
    let user: UserProfile = mockUser

    var body: some View {
        VStack {
            List {
                ProfileHeader(user: user)
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets())
                
                Section {
                    ProfileSectionCard(
                        icon: .aboutMe,
                        title: "About Me",
                        content: AnyView(
                            Text(user.aboutMe)
                                .foregroundColor(.gray)
                                .customFont(.medium)
                        )
                    )
                }
                Section {
                    ProfileSectionCard(
                        icon: .workExperience,
                        title: "Work experience",
                        content: AnyView(
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(user.workExperience) { exp in
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
                                }
                            }
                        )
                    )
                }
                Section {
                    ProfileSectionCard(
                        icon: .education,
                        title: "Education",
                        content: AnyView(
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(user.education) { edu in
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
                                }
                            }
                        )
                    )
                }
                Section {
                    ProfileSectionCard(
                        icon: .language,
                        title: "Languages",
                        content: AnyView(
                            WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
                                ForEach(user.languages, id: \.self) { lang in
                                    Text(lang)
                                        .foregroundStyle(.textColor2)
                                        .customFont(.medium, 14)
                                        .padding([.horizontal, .vertical], 12)
                                        .background(Color(.systemGray6))
                                        .clipShape(.capsule)
                                }
                            }
                        )
                    )
                }
                Section {
                    ProfileSectionCard(
                        icon: .appreciation,
                        title: "Appreciations",
                        content: AnyView(
                            VStack(alignment: .leading) {
                                ForEach(user.appreciations, id: \.id) { app in
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
                                }
                            }
                        )
                    )
                }
                Section {
                    ProfileSectionCard(
                        icon: .skill,
                        title: "Skills",
                        content: AnyView(
                            WrappingHStack(id: \.self, alignment: .leading, horizontalSpacing: 8, verticalSpacing: 8) {
                                ForEach(user.skills.prefix(5), id: \.self) { skill in
                                    Text(skill)
                                        .foregroundStyle(.textColor2)
                                        .customFont(.medium, 14)
                                        .padding([.horizontal, .vertical], 12)
                                        .background(Color(.systemGray6))
                                        .clipShape(.capsule)
                                }
                                
                                //                            if user.skills.count > 5 {
                                //                                Text("\(user.skills.count - 5) more")
                                //                                    .foregroundStyle(.textColor2)
                                //                                    .customFont(.medium, 14)
                                //                                    .id("custom")
                                //                            }
                            }
                        )
                    )
                }
                Section {
                    ProfileSectionCard(
                        icon: .resume,
                        title: "Resume",
                        content: AnyView(
                            HStack {
                                Image(.pdf)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                                Text(user.resume)
                                    .foregroundColor(.blue)
                            }
                            
                        )
                    )
                }
            }
            .listSectionSpacing(.custom(16))
        }
        .background(Color(.systemGray6))
        .navigationBarBackButtonHidden()
        .navigationBarColor(backgroundColor: Color(.systemGray6))
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                backButton()
            }
        }
    }
    
    private func backButton() -> some View {
        Button {
            routerPath.goBack()
        } label: {
            Image(systemName: "arrow.left")
                .foregroundColor(.text)
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

