//
//  ViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import Foundation
import Parse

class ViewController: UIViewController {
    
    @IBOutlet weak var Check_Flavors: UIButton!
    @IBOutlet weak var Submit_Flavors: UIButton!
    @IBOutlet weak var About: UIButton!
    @IBOutlet weak var Set_Favorites: UIButton!
    @IBOutlet weak var NameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var localNotification: UILocalNotification = UILocalNotification()
        localNotification.alertAction = "Testing notifications on iOS8"
        localNotification.alertBody = "Wow it works"
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 30)
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        self.Check_Flavors.setValue(UIFont(name: "Raleway-Medium", size: 15), forKey: "font")
        self.Submit_Flavors.setValue(UIFont(name: "Raleway-Medium", size: 15), forKey: "font")
        self.About.setValue(UIFont(name: "Raleway-Medium", size: 15), forKey: "font")
        self.Set_Favorites.setValue(UIFont(name: "Raleway-Medium", size: 15), forKey: "font")
        
        
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser().username != nil) {
            var FName: String! = PFUser.currentUser().valueForKey("first_name") as String
            self.NameLabel.text = "Hi, " + FName + "!"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage() {
        let alertController = UIAlertController(title:"Dan's First App", message: "Colby Ice Cream", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func logOut(sender: AnyObject) {
        PFUser.logOut()
        self.performSegueWithIdentifier("loggedOut", sender: self)
    }
    
    
}

