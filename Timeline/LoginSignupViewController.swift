//
//  LoginSignupViewController.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var actionButton: UIButton!
    var mode: ViewMode = .Login
    var user: User?
    var viewMode = ViewMode.Signup
    var fieldsAreValid: Bool {
        get {
            switch mode {
            case .Signup: if usernameTextField.text != "" && emailTextField.text != "" &&  passwordTextField.text != "" {
                return true
            } else {
                return false
                }
            case .Login: if emailTextField.text != "" && passwordTextField.text != "" {
                return true
            } else {
                return false
                }
            case .Edit: return !(usernameTextField.text!.isEmpty)
            }
        }
    }
    
    
    enum ViewMode {
        case Login
        case Signup
        case Edit
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        actionButton.layer.cornerRadius = 3
        updateViewBasedOnMode()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewBasedOnMode() {
        
        switch mode {
        case .Signup: actionButton.setTitle("Sign Up", forState: .Normal)
        case .Login: actionButton.setTitle("Login", forState: .Normal)
            usernameTextField.hidden = true
            bioTextField.hidden = true
            urlTextField.hidden = true
        case .Edit:
            actionButton.setTitle("Update", forState: .Normal)
            
            emailTextField.hidden = true
            passwordTextField.hidden = true
            
            if let user = self.user {
                usernameTextField.text = user.username
                bioTextField.text = user.bio
                urlTextField.text = user.url
            }
        }
    }
    
    func updateWithUser(user: User) {
        self.user = user
        viewMode = .Edit
    }
    
    @IBAction func actionButtonTapped(sender: AnyObject) {
        if fieldsAreValid {
            switch mode {
            case .Signup: UserController.createUser(emailTextField.text!, username: usernameTextField.text!, password: passwordTextField.text!, completion: { (success, user) -> Void in
                if success {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.presentValidationAlertWithTitle("Unable to Create Account", message: "Username, Email, and Password are required for signing up. Try again.")
                }
            })
            case .Login: UserController.authenticateUser(emailTextField.text!, password: passwordTextField.text!, completion: { (success, user) -> Void in
                if success {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.presentValidationAlertWithTitle("Invalid Login", message: "Email or Password was not valid. Try again.")
                }
            })
            case .Edit: UserController.updateUser(self.user!, username: self.usernameTextField.text!, bio: self.bioTextField.text, url: self.urlTextField.text, completion: { (success, user) -> Void in
                if success {
                    self.dismissViewControllerAnimated(true, completion: nil)
                } else {
                    self.presentValidationAlertWithTitle("Unable to Update User", message: "Please check your information and try again")
                }
            })
            }
            
        }
        else {
            self.presentValidationAlertWithTitle("Error", message: "One of your fields is empty")
        }
    }
    
    func presentValidationAlertWithTitle(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (Alert) -> Void in
            print("User didn't login correctly")
        }
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
