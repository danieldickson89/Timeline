//
//  User.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct User: Equatable, FirebaseType {
    
    private let kUsername = "username"
    private let kBio = "bio"
    private let kURL = "url"
    
    var username = ""
    var bio: String?
    var url: String?
    var identifier: String?
    var endpoint: String {
        return "users"
    }
    var jsonValue: [String: AnyObject] {
        var json: [String: AnyObject] = [kUsername: username]
        
        if let bio = bio {
            json.updateValue(bio, forKey: kBio)
        }
        
        if let url = url {
            json.updateValue(url, forKey: kURL)
        }
        
        return json
    }
    
    init?(json: [String: AnyObject], identifier: String) {
        
        guard let username = json[kUsername] as? String else { return nil }
        
        self.username = username
        self.bio = json[kBio] as? String
        self.url = json[kURL] as? String
        self.identifier = identifier
    }
    
    init(username: String, uid: String, bio: String? = nil, url: String? = nil) {
        
        self.username = username
        self.bio = bio
        self.url = url
        self.identifier = uid
    }
}

func ==(lhs: User, rhs: User) -> Bool {
    if let identifier = rhs.identifier {
        return lhs.username == identifier
    } else {
        return false
    }
}