//
//  CustomLogInViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/28/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit
import Parse
import ParseFacebookUtilsV4

struct UserInfo {
    static var name:String!
    static var first_name:String!
    static var id: String!
}

class CustomLogInViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var LoginTitle: UILabel!
    
    
    var actInd: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0,150,150)) as UIActivityIndicatorView
    
    let colorGen = ColorGenerator()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.LoginTitle.setValue(UIFont(name: "Raleway-Light", size:30), forKey: "font")
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#5FA9FF", hexBottom: "#C29EFF")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        self.actInd.center = self.view.center
        
        self.actInd.hidesWhenStopped = true
        
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(self.actInd)
        
        if (FBSDKAccessToken.currentAccessToken() == nil) {
            print("Not logged in")
        }
        else {
            print("Logged in!")
        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.center = self.view.center
        loginButton.delegate = self
        self.view.addSubview(loginButton)
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if ((PFUser.currentUser()?.username) != nil) {
            getUserInfo()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Mark -- Actions
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
            
            self.actInd.startAnimating()
            
            PFFacebookUtils.logInInBackgroundWithAccessToken(FBSDKAccessToken.currentAccessToken(), block: { (user: PFUser?, error: NSError?) -> Void in
                self.actInd.stopAnimating()
                print(error)
                if ((user) != nil){
                    let alert = UIAlertView(title: "Success", message: "Logged in", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    self.getUserInfo()
                    self.performSegueWithIdentifier("loggedIn", sender: nil)
                }
                else {
                    let alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                }
            
                
            })
            
    }

    func getUserInfo() {
        let graphRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"name,first_name"])
        graphRequest.startWithCompletionHandler({(connection, result, error) -> Void in
            if ((error) != nil) {
                print("Could not get user info")
            }
            else {
                UserInfo.first_name = (result.valueForKey("first_name") as! String!)
                UserInfo.name = (result.valueForKey("name") as! String!)
                UserInfo.id = (result.valueForKey("id") as! String!)
                
                self.performSegueWithIdentifier("loggedIn", sender: nil)
            }
        })

    }


    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User logged out")
    }
    
    @IBAction func SignupAction(sender: AnyObject) {
        
        self.performSegueWithIdentifier("signUp", sender: self)
        
    }
    
    

}
