//
//  AuthManager.swift
//  SDK
//
//  Created by Kartikeya Singh on 08/07/24.
//

import Foundation

public class AuthManager {
    private var users: [String: String]
    
    public init(users: [String: String]) {
        self.users = users
    }
    
    public var onboardedUsers: [User] = []
    
    public func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        // Simulate network call for example purposes
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if let storedPassword = self.users[username], storedPassword == password {
                let user = User(username: username, token: "123456")
                self.onboardedUsers.append(user)
                completion(.success(user))
            } else {
                completion(.failure(NSError(domain: "AuthError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])))
            }
        }
    }
}

public struct User {
    public let username: String
    public let token: String
    
    public init(username: String, token: String) {
        self.username = username
        self.token = token
    }
}
