//
//  CheckboxStyle.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI

struct CheckboxStyle: ToggleStyle {
    let label: String
    func makeBody(configuration: Self.Configuration) -> some View {
        return HStack {
            Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(configuration.isOn ? .darkBlue : .gray)
                .font(.system(size: 20, weight: .regular, design: .default))
            
            Text(label)
                .font(.system(size: 16))
                .foregroundColor(.gray)
        }
        .contentShape(Rectangle())
        .onTapGesture {
            withAnimation {
                configuration.isOn.toggle()
            }
        }
    }
}
