//
//  ProfileHeaderCollectionReusableView.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/25/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

protocol ProfileHeaderCollectionReusableViewDelegate {
    
    func userTappedFollowActionButton()
    func userTappedURLButton()
}


class ProfileHeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var urlButton: UIButton!
    @IBOutlet weak var followUserButton: UIButton!
    
    var delegate: ProfileHeaderCollectionReusableViewDelegate?
    
    func updateWithUser(user: User) {
        if let bio = user.bio {
            bioLabel.text = bio
        } else {
            bioLabel.hidden = true
        }
        
        if let url = user.url {
            urlButton.setTitle(url, forState: .Normal)
        } else {
            urlButton.hidden = true
        }
        
        if user == UserController.sharedUserController.currentUser {
            followUserButton.setTitle("Logout", forState: .Normal)
        } else {
            UserController.userFollowsUser(UserController.sharedUserController.currentUser, user2: user, completion: { (follows) -> Void in
                if follows {
                    self.followUserButton.setTitle("Unfollow", forState: .Normal)
                } else {
                    self.followUserButton.setTitle("Follow", forState: .Normal)
                }
            })
        }
    }
    
    @IBAction func urlButtonTapped(sender: AnyObject) {
        delegate?.userTappedURLButton()
    }
    
    @IBAction func followUserButtonTapped(sender: AnyObject) {
        delegate?.userTappedFollowActionButton()
    }
    
    
}
