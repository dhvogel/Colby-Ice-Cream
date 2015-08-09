//
//  CustomSignUpViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/28/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit
import Parse

class CustomSignUpViewController: UIViewController {

    @IBOutlet weak var FirstNameField: UITextField!
    @IBOutlet weak var LastNameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ReTypePasswordField: UITextField!
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        
        self.actInd.hidesWhenStopped = true
        
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions

    @IBAction func signUpAction(sender: AnyObject) {
        
        var username = self.UsernameField.text
        var password = self.PasswordField.text
        var ReTypepassword = self.ReTypePasswordField.text
        var email = self.EmailField.text
        var FName = self.FirstNameField.text
        var LName = self.LastNameField.text
        
        
        if (username.utf16Count < 4) {
            var alert = UIAlertView(title: "Invalid", message: "Username must be more than 4 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if(password.utf16Count < 5 || password.utf16Count > 20) {
            var alert = UIAlertView(title: "Invalid", message: "Password must be between 5 and 20 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (email.utf16Count < 8) {
            var alert = UIAlertView(title: "Invalid", message: "Please enter valid email", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (FName.utf16Count < 1) {
            var alert = UIAlertView(title: "Invalid", message: "Please enter valid first name", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (LName.utf16Count < 1) {
            var alert = UIAlertView(title: "Invalid", message: "Please enter valid last name", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (password != ReTypepassword) {
            var alert = UIAlertView(title: "Invalid", message: "Re-typed password does not match password", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
            
            
        else {
            
            self.actInd.startAnimating()
            
            var newUser = PFUser()
            newUser.username = username
            newUser.password = password
            newUser.email = email
            newUser["first_name"] = FName
            newUser["last_name"] = LName
            
            
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if((error) != nil) {
                    
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                else {
                    
                    var alert = UIAlertView(title: "Success", message: "Signed Up!", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                    self.performSegueWithIdentifier("justSignedUp", sender: nil)
                    
                }
            })
            
            
        }
        
        
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
