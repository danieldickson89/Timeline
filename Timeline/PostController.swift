//
//  PostController.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static func fetchTimelineForUser(user: User, completion: (post: [Post]) -> Void) {
        completion(post: mockPosts())
    }
    
    static func addPost(image: UIImage, caption: String? = nil, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[0])
    }
    
    static func postFromIdentifier(identifier: String, completion: (post: Post?) -> Void) {
        completion(post: mockPosts()[0])
    }
    
    static func postsForUser(user: User, completion: (posts: [Post]?) -> Void) {
        completion(posts: [mockPosts()[0], mockPosts()[1], mockPosts()[2]])
    }
    
    static func deletePost(post: Post) {
        
    }
    
    static func addCommentWithTextToPost(text: String, post: Post, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[0])
    }
    
    static func deleteComment(comment: Comment, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[1])
    }
    
    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[0])
    }
    
    static func deleteLike(like: Like, completion: (success: Bool, post: Post?) -> Void) {
        completion(success: true, post: mockPosts()[2])
    }
    
    static func orderPosts(posts: [Post]) -> [Post] {
        return []
    }
    
    static func mockPosts() -> [Post] {
        
        let post1 = Post(imageEndPoint: "Ocean Pic", caption: "Dude, sick pic brah!", username: "surferDude")
        let post2 = Post(imageEndPoint: "Mountians", caption: "So majestic...", username: "mountainManDan")
        let post3 = Post(imageEndPoint: "Puppy", caption: "cute!", username: "girlygirl")
        
        return [post1, post2, post3]
    }
    
    
}