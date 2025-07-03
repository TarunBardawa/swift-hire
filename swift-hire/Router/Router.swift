//
//  Router.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 03/07/25.
//

import SwiftUI
import Combine

public enum RouterDestination: Hashable {
    case onboarding
    case login
    case loggedIn
    case recentJobs
}

@MainActor
@Observable public class RouterPath {
    
    public var path: [RouterDestination] = []
    
    public init() {}
    
    public func navigate(to: RouterDestination) {
        path.append(to)
    }
    
    public func removeLast(count: Int) {
        path.removeLast(count)
    }
    
    public func goBack() {
        path.removeLast()
    }
    
    public func popToRoot() {
        path.removeAll()
    }
    
}
