//
//  loginViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/24/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import Foundation
import Parse
import ParseUI


class loginViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var logInViewController: PFLogInViewController! = PFLogInViewController()
    var signUpViewController: PFSignUpViewController! = PFSignUpViewController()
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var PwordField: UITextField!
    
 
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
       
        
        
    }
    

    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Parse Login
    
    func logInViewController(logInController: PFLogInViewController!, shouldBeginLogInWithUsername username: String!, password: String!) -> Bool {
        
        if (!username.isEmpty || !password.isEmpty) {
            return true
        }
        else {
            return false
        }
        
    }
    
    func logInViewController(logInController: PFLogInViewController!, didLogInUser user: PFUser!) {
        
        print("yay!")
        
    }
    
    func logInViewController(logInController: PFLogInViewController!, didFailToLogInWithError error: NSError!) {
        print("failure to login.")
    }
    
    //Mark: Parse Sign Up
   
    
    func signUpViewController(signUpController: PFSignUpViewController!, didSignUpUser user: PFUser!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func signUpViewController(signUpController: PFSignUpViewController!, didFailToSignUpWithError error: NSError!) {
        print("Failed to signup")
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController!) {
        print("User dismissed sign up.")
    }
    
    //Mark: Actions
    
    @IBAction func simpleAction(sender: AnyObject) {
        
        self.presentViewController(self.logInViewController, animated: true, completion: nil)
    }

    @IBAction func customAction(sender: AnyObject) {
        self.performSegueWithIdentifier("custom", sender: self)
    }
    
    
    @IBAction func logOutAction(sender: AnyObject) {
        PFUser.logOut()
    }
    
    //Mark: - Facebook Login
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
