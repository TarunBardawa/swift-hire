//
//  UserProfile.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 05/07/25.
//

import SwiftUI

struct UserProfile: Identifiable, Codable {
    var id = UUID()
    let name: String
    let location: String
    let followers: String
    let following: String
    let aboutMe: String
    let workExperience: [WorkExperience]
    let education: [Education]
    let languages: [String]
    let resume: String
    let appreciations: [Appreciation]
    let skills: [String]
    let profileImage: String // Name of image asset
    
    enum CodingKeys: String, CodingKey {
        case name, location, followers, following, aboutMe, workExperience, education, languages, resume, appreciations, skills, profileImage
    }
}

struct WorkExperience: Identifiable, Hashable, Codable {
    var id = UUID()
    let title: String
    let company: String
    let period: String
    let duration: String
    
    enum CodingKeys: String, CodingKey {
        case title, company, period, duration
    }
}

struct Education: Identifiable, Codable {
    var id = UUID()
    let degree: String
    let institution: String
    let year: String
    
    enum CodingKeys: String, CodingKey {
        case degree, institution, year
    }
}

struct Appreciation: Identifiable, Codable {
    var id = UUID()
    let provider: String
    let title: String
    let year: String
    
    enum CodingKeys: String, CodingKey {
        case provider, title, year
    }
}

// MARK: - Mock Data

let mockUser = UserProfile(
    name: "Tarun B",
    location: "Jaipur",
    followers: "12k",
    following: "12K",
    aboutMe: "iOS engineer passionate about building beautiful and functional apps. Loves Swift, SwiftUI, and clean architecture.",
    workExperience: [
        WorkExperience(
            title: "Senior iOS Developer",
            company: "Innovatech Solutions Inc.",
            period: "Jan 2015 - Dec 2019",
            duration: "4 yrs 11 mos"
        )
    ],
    education: [
        Education(
            degree: "B.Sc. Computer Science",
            institution: "Swift University",
            year: "2011 - 2015"
        )
    ],
    languages: ["English", "Spanish"],
    resume: "Tarun_resume.pdf",
    appreciations: [
        Appreciation(provider: "Amplework", title: "Employee of the Year", year: "2022")
    ],
    skills: ["Swift", "SwiftUI", "Combine", "UI/UX", "Git", "React Native", "Firebase", "Flutter"],
    profileImage: "userProfile"
)
