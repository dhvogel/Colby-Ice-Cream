//
//  Submit_Flavors.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Submit_Flavors: UIViewController {
    
    @IBOutlet weak var TestLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TestLabel.text = "What flavors are in " + Hall_Select + "?"

        
        
        
        // Do any additional setup after loading the view.

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitFlavors(sender: AnyObject) {
        if (flavors.count == 4) {
            var msg = "You submitted "
            msg = msg + flavors[0] + ", "
            msg = msg + flavors[1] + ", "
            msg = msg + flavors[2] + ", and "
            msg = msg + flavors[3]
            msg = msg + " for " + Hall_Select
            let alertController = UIAlertController(title:"Great, Thanks!", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else {
            let alertController = UIAlertController(title:"Error", message: "Please select 4 flavors", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        
//        var testObject = PFObject(className:"ICSubmit")
//        testObject["DHall"] = Hall_Select
//        testObject["Flavor1"] = "Chocolate"
//        testObject["Flavor2"] = "Vanilla"
//        testObject["Flavor3"] = "Campfire S'mores"
//        testObject["Flavor4"] = "Strawberry"
//        testObject.saveInBackground()

        
        
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
