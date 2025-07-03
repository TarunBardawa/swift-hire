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
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(viewModel.companies) { company in
                    CompanyCardView(company: company)
                }
            }
            .padding()
        }
        .background(Color(.systemGray5).edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    Companies()
}
