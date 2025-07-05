//
//  AppLayout.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 06/07/25.
//

import Foundation
import SwiftUI

struct AppLayout {
    static var tabBarHeight: CGFloat {
        let keyWindow = UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        return 50 + (keyWindow?.safeAreaInsets.bottom ?? 0)
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
