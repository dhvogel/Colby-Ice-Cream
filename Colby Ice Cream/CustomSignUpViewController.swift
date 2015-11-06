//
//  CustomSignUpViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/28/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit
import Parse

class CustomSignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var FirstNameField: UITextField!
    @IBOutlet weak var LastNameField: UITextField!
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var ReTypePasswordField: UITextField!
    @IBOutlet weak var SignUpTitle: UILabel!
    let colorGen = ColorGenerator()
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.SignUpTitle.setValue(UIFont(name: "Raleway-Light", size:20), forKey: "font")
        
        self.ReTypePasswordField.delegate = self
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#6AD922", hexBottom: "#70FFD9")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        self.actInd.center = self.view.center
        
        self.actInd.hidesWhenStopped = true
        
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions

    @IBAction func signUpAction(sender: AnyObject) {
        
        let username = self.UsernameField.text
        let password = self.PasswordField.text
        let ReTypepassword = self.ReTypePasswordField.text
        let email = self.EmailField.text
        let FName = self.FirstNameField.text
        let LName = self.LastNameField.text
        
        
        if (username!.utf16.count < 4) {
            let alert = UIAlertView(title: "Invalid", message: "Username must be more than 4 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if(password!.utf16.count < 5 || password!.utf16.count > 20) {
            let alert = UIAlertView(title: "Invalid", message: "Password must be between 5 and 20 characters", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (email!.utf16.count < 11 || String(email!.characters.suffix(10)) != "@colby.edu") {
            let alert = UIAlertView(title: "Invalid", message: "Please enter valid Colby email (ending in @colby.edu)", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (FName!.utf16.count < 1) {
            let alert = UIAlertView(title: "Invalid", message: "Please enter valid first name", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (LName!.utf16.count < 1) {
            let alert = UIAlertView(title: "Invalid", message: "Please enter valid last name", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
        else if (password != ReTypepassword) {
            let alert = UIAlertView(title: "Invalid", message: "Re-typed password does not match password", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
            
            
        else {
            
            self.actInd.startAnimating()
            
            let newUser = PFUser()
            newUser.username = username!.lowercaseString
            newUser.password = password
            newUser.email = email
            newUser.setValue(FName,forKey:"first_name")
            newUser.setValue(LName,forKey:"last_name")
            
            
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if((error) != nil) {
                    
                    let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                else {
                    
                    let alert = UIAlertView(title: "Success", message: "Signed Up!", delegate: self, cancelButtonTitle: "OK")
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
