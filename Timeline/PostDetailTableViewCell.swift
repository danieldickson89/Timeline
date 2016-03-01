//
//  PostDetailTableViewCell.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/26/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PostDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    func updateWithPost(post: Post) {
        self.postImageView.image = nil
        self.likesLabel?.text = "\(post.likes.count)"
        self.commentsLabel?.text = "\(post.comments.count)"
        
        ImageController.imageForIdentifier(post.imageEndPoint) { (image) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.postImageView.image = image
            })
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
