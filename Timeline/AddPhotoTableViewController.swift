//
//  AddPhotoTableViewController.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class AddPhotoTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    
    @IBOutlet weak var addPhotoButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    var image: UIImage?
    var caption: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addPhotoButtonTapped(sender: AnyObject) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alert = UIAlertController(title: "Select Photo Location", message: nil, preferredStyle: .ActionSheet)
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            alert.addAction(UIAlertAction(title: "Photo Library", style: .Default, handler: { (_) -> Void in
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            alert.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { (_) -> Void in
                imagePicker.sourceType = .Camera
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        self.image = image
        addPhotoButton.setTitle("", forState: .Normal)
        addPhotoButton.setBackgroundImage(self.image, forState: .Normal)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        caption = textField.text
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func submitButtonTapped(sender: AnyObject) {
        self.view.window?.endEditing(true)
        if let image = image {
            
            // POST Image
            
            PostController.addPost(image, caption: self.caption, completion: { (success, post) -> Void in
                if post != nil {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    let failedAlert = UIAlertController(title: "Failed!", message: "Imaged failed to post. Please try again.", preferredStyle: .Alert)
                    failedAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                    self.navigationController?.popViewControllerAnimated(true)
                }
            })
        }
    }
    
    @IBAction func cancelButtonTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}