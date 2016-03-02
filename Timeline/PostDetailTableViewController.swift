//
//  PostDetailTableViewController.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class PostDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var likesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!
    
    var post: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateBasedOnPost()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        PostController.addLikeToPost(post!) { (success, post) -> Void in
            if let post = post {
                self.post = post
                self.updateBasedOnPost()
            }
        }
    }
    
    @IBAction func addCommentButtonTapped(sender: AnyObject) {
        let commentAlert = UIAlertController(title: "Add Comment", message: nil, preferredStyle: .Alert)
        commentAlert.addTextFieldWithConfigurationHandler { (textfield) -> Void in
            textfield.placeholder = "Comment"
        }
        commentAlert.addAction(UIAlertAction(title: "Add Comment", style: .Default, handler: { (action) -> Void in
            if let text = commentAlert.textFields?.first?.text {
                PostController.addCommentWithTextToPost(text, post: self.post!, completion: { (success, post) -> Void in
                    if let post = post {
                        self.post = post
                        self.updateBasedOnPost()
                    }
                })
            }
        }))
        commentAlert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        presentViewController(commentAlert, animated: true, completion: nil)
    }
    
    func updateBasedOnPost() {
        guard let post = post else { return }
        self.likesLabel.text = "\(post.likes.count) likes"
        self.commentsLabel.text = "\(post.comments.count) comments"
        
        ImageController.imageForIdentifier(post.imageEndPoint) { (image) -> Void in
            self.headerImageView.image = image
        }
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let postCount = post?.comments.count {
            return postCount
        } else {
            return 0
        }
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("commentCell", forIndexPath: indexPath)
        
        let comment = post?.comments[indexPath.row]
        
        if let comment = comment {
            cell.textLabel?.text = comment.username
            cell.detailTextLabel?.text = comment.text
        }
        
        return cell
    }
    
    
}
