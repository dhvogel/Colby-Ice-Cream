//
//  ViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import Foundation
import Parse
import FBSDKCoreKit

class ViewController: UIViewController {
    
    @IBOutlet weak var NameLabel: UILabel!
    let colorGen = ColorGenerator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#FB6A87", hexBottom: "#FB88FF")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.NameLabel.text = "Fetching name..."
        
        let graphRequest:FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"first_name"])
        graphRequest.startWithCompletionHandler({(connection, result, error) -> Void in
            if ((error) != nil) {
                print("Could not retrieve name")
            }
            else {
                print(result)
                print(result.valueForKey("first_name"))
                let FName:String! = result.valueForKey("first_name") as? String
                self.NameLabel.text = "Hi, " + FName + "!"
            }
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func logOut(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("loggedOut", sender: self)
    }
    
    
}

