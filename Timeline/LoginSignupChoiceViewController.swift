//
//  LoginSignupChoiceViewController.swift
//  Timeline
//
//  Created by Daniel Dickson on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class LoginSignupChoiceViewController: UIViewController {

    @IBOutlet weak var timelineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signUpButton.layer.cornerRadius = 3
        loginButton.layer.cornerRadius = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let loginSignupViewController = segue.destinationViewController as! LoginSignupViewController
        if segue.identifier == "toSignUp" {
            loginSignupViewController.mode = .Signup
        } else if segue == "toLogin" {
            loginSignupViewController.mode = .Login
        }
    }


}
