//
//  Submit_Flavors.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Submit_Flavors: UIViewController {
    
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var Chocolate: UILabel!
    @IBOutlet weak var Vanilla: UILabel!
    @IBOutlet weak var Strawberry: UILabel!
    @IBOutlet weak var Campfire_Smore: UILabel!
    @IBOutlet weak var Coffee: UILabel!
    @IBOutlet weak var Cookie_Dough: UILabel!
    @IBOutlet weak var Mint_Choc_Chip: UILabel!
    @IBOutlet weak var Deer_Tracks: UILabel!
    @IBOutlet weak var Cake_Batter: UILabel!
    @IBOutlet weak var Salted_Caramel: UILabel!
    @IBOutlet weak var Toasted_Coconut: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.TitleLabel.text = "What flavors are in " + Hall_Select + "?"
        self.TitleLabel.font = UIFont(name: "Vacaciones", size: 20)
        self.Chocolate.font = UIFont(name: "Vacaciones", size: 15)
        self.Vanilla.font = UIFont(name: "Vacaciones", size: 15)
        self.Strawberry.font = UIFont(name: "Vacaciones", size: 15)
        self.Campfire_Smore.font = UIFont(name: "Vacaciones", size:15)
        self.Coffee.font = UIFont(name: "Vacaciones", size: 15)
        self.Cookie_Dough.font = UIFont(name: "Vacaciones", size: 15)
        self.Mint_Choc_Chip.font = UIFont(name: "Vacaciones", size: 15)
        self.Deer_Tracks.font = UIFont(name: "Vacaciones", size: 15)
        self.Cake_Batter.font = UIFont(name: "Vacaciones", size: 15)
        self.Salted_Caramel.font = UIFont(name: "Vacaciones", size:15)
        self.Toasted_Coconut.font = UIFont(name: "Vacaciones", size: 15)
        
        
        
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
            
//            var ICSubmission = PFObject(className:"ICSubmit")
//            ICSubmission["DHall"] = Hall_Select
//            ICSubmission["Flavor1"] = flavors[0]
//            ICSubmission["Flavor2"] = flavors[1]
//            ICSubmission["Flavor3"] = flavors[2]
//            ICSubmission["Flavor4"] = flavors[3]
//            ICSubmission.saveInBackground()
            
            flavors = []
        }
        else {
            let alertController = UIAlertController(title:"Error", message: "Please select 4 flavors", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
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
