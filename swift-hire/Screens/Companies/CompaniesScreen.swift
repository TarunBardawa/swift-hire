//
//  Companies.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct Companies: View {
    @StateObject private var viewModel = CompaniesViewModel()
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.companies) { company in
                        CompanyCardView(company: company) { company in
                            viewModel.followCompany(company)
                        }
                    }
                }
                .padding()
                .padding(.bottom, AppLayout.tabBarHeight)
            }
            .background(Color(.systemGray5).edgesIgnoringSafeArea(.all))
            .navigationBarColor(backgroundColor: Color(.systemGray5), titleColor: .text)
        }
    }
}

#Preview {
    Companies()
}
