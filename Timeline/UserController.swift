//
//  UserController.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class UserController {
    
    let currentUser: User! = UserController.mockUsers().first!
    
    static let sharedUserController = UserController()
    
    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        completion(user: mockUsers()[0])
    }
    
    static func fetchAllUsers(completion: (user: [User]) -> Void) {
        completion(user: [mockUsers()[1], mockUsers()[2]])
    }
    
    static func followUser(user: User, completion: (success: Bool) -> Void) {
        completion(success: true)
    }
    
    static func userFollowsUser(user1: User, user2: User, completion: (follows: Bool) -> Void) {
        completion(follows: true)
    }
    
    static func followedByUser(user: User, completion: (followingUsers: [User?]) -> Void) {
        completion(followingUsers: [mockUsers()[3]])
    }
    
    static func authenticateUser(email: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers()[0])
    }
    
    static func createUser(email: String, username: String, password: String, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers()[0])
    }
    
    static func updateUser(user: User, username: String, bio: String? = nil, url: String? = nil, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: mockUsers()[0])
    }
    
    static func logoutCurrentUser() {
        
    }
    
    static func mockUsers() -> [User] {
        let user1 = User(username: "Daniel", bio: "I was born, and now I'm here", url: nil, identifier: "daniel")
        let user2 = User(username: "Billy", bio: "Call me Bill", url: "billy.com", identifier: "billy")
        let user3 = User(username: "Joe", bio: nil, url: nil, identifier: "joe")
        let user4 = User(username: "Harry Potter", bio: "You're a wizard Harry", url: "hogwartspunk.com", identifier: "notamuggle")
        let mockPeeps = [user1, user2, user3, user4]
        
        return mockPeeps
    }
    
    
    
    
    
    
    
}