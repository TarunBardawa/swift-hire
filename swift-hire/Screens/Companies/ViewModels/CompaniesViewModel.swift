//
//  CompanyViewModel.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

@MainActor
class CompaniesViewModel: ObservableObject {
    
    @Published private(set) var companies: [Company] = []
    @Published private(set) var isLoading: Bool = false
    
    @Published private(set) var errorMessage: String?
    
    private let apiService = APIService.shared
    
    init() {
        Task { await fetchCompanies() }
    }
    
    func followCompany(_ company: Company) {
        if let index = companies.firstIndex(where: { $0.companyName == company.companyName }) {
            companies[index].isFollowed = !companies[index].isFollowed
        }
    }
    
    func fetchCompanies() async {
        isLoading = true
        defer { isLoading = false }
        try? await Task.sleep(for: .seconds(2))
        let result: APIResult<[Company]> = await apiService.fetch(endpoint: "https://dummyjson.com/c/5543-00ce-4928-b6e8")
        
        switch result {
        case .success(let cmp):
            companies = cmp
            errorMessage = nil
        case .failure(let message):
            errorMessage = message
        }
    }
}
