//
//  Check_Flavors.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Check_Dana: UIViewController {

    
    @IBOutlet weak var Dana_Flavor1: UILabel!
    
    @IBOutlet weak var Dana_Flavor2: UILabel!
    
    @IBOutlet weak var Dana_Flavor3: UILabel!
    
    @IBOutlet weak var Dana_Flavor4: UILabel!
    
    @IBOutlet weak var Submitted_By: UILabel!
    
    @IBOutlet weak var Time_Label: UILabel!
    
    func getDanaFlavors(){
        let query = PFQuery(className: "ICSubmit")
        query.whereKey("DHall", equalTo: "Dana")
        query.orderByDescending("createdAt")

        var obj = query.getFirstObject()
        
        let Dana_Flavor_1:AnyObject = obj["Flavor1"]
        let F1String = "\(Dana_Flavor_1)"
        self.Dana_Flavor1.text = F1String
        
        let Dana_Flavor_2:AnyObject = obj["Flavor2"]
        let F2String = "\(Dana_Flavor_2)"
        self.Dana_Flavor2.text = F2String
        
        let Dana_Flavor_3:AnyObject = obj["Flavor3"]
        let F3String = "\(Dana_Flavor_3)"
        self.Dana_Flavor3.text = F3String
        
        let Dana_Flavor_4:AnyObject = obj["Flavor4"]
        let F4String = "\(Dana_Flavor_4)"
        self.Dana_Flavor4.text = F4String
//        
//        let name: String! = obj["submitted_FName"] as String
//        self.Submitted_By.text = name
//        
//        var dateUpdated = obj.updatedAt as NSDate
//        var dateFormat = NSDateFormatter()
//        dateFormat.dateFormat = "MMM d, h:mm a"
//        self.Time_Label.text = NSString(format: "%@", dateFormat.stringFromDate(dateUpdated)) as String
       
        
        
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getDanaFlavors()
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

}
