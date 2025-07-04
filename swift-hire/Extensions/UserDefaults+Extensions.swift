//
//  UserDefaults+Extensions.swift
//  swift-hire
//
//  Created by Tarun Bardawa on 04/07/25.
//

import Foundation

public extension UserDefaults {
    static var sharedDefaults = UserDefaults.standard
}

extension UserDefaults {
    func saveUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            self.set(encoded, forKey: "user")
        }
    }
    
    func getUser() -> User? {
        if let savedUser = self.object(forKey: "user") as? Data {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(User.self, from: savedUser) {
                return user
            }
        }
        return nil
    }
    
    func updateUser(_ updates: [PartialKeyPath<User>: Any]) {
        if var user = getUser() {
            for (keyPath, value) in updates {
                if let writableKeyPath = keyPath as? WritableKeyPath<User, String>,
                   let newValue = value as? String {
                    user[keyPath: writableKeyPath] = newValue
                } else if let writableKeyPath = keyPath as? WritableKeyPath<User, Int>,
                          let newValue = value as? Int {
                    user[keyPath: writableKeyPath] = newValue
                } else if let writableKeyPath = keyPath as? WritableKeyPath<User, Bool>,
                          let newValue = value as? Bool {
                    user[keyPath: writableKeyPath] = newValue
                }
            }
            saveUser(user)
        }
    }
    
    func resetDefaults() {
        self.removeObject(forKey: "user")
        self.synchronize()
    }
}
