//
//  AddPost.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI
import BottomSheet

struct AddPost: View {
    
    @State var bottomSheetPosition: BottomSheetPosition = .absolute(400)
    
    var body: some View {
        VStack {
            Text("")
        }
        .frame(maxHeight: .infinity)
        .background(.white)
        .bottomSheet(bottomSheetPosition: $bottomSheetPosition, switchablePositions: [.absolute(400)], content: {
            AddPostSheet()
        })
    }
}
