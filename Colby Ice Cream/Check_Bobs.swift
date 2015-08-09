//
//  Check_Bobs.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/23/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Check_Bobs: UIViewController {
    
    @IBOutlet weak var Bobs_Flavor1: UILabel!
    
    @IBOutlet weak var Bobs_Flavor2: UILabel!
    
    @IBOutlet weak var Bobs_Flavor3: UILabel!
    
    @IBOutlet weak var Bobs_Flavor4: UILabel!
    
    
    func getBobsFlavors(){
        let query = PFQuery(className: "ICSubmit")
        query.whereKey("DHall", equalTo: "Bobs")
        query.orderByDescending("createdAt")
        
        var obj = query.getFirstObject()
        
        let Bobs_Flavor_1:AnyObject = obj["Flavor1"]
        let F1String = "\(Bobs_Flavor_1)"
        self.Bobs_Flavor1.text = F1String
        
        let Bobs_Flavor_2:AnyObject = obj["Flavor2"]
        let F2String = "\(Bobs_Flavor_2)"
        self.Bobs_Flavor2.text = F2String
        
        let Bobs_Flavor_3:AnyObject = obj["Flavor3"]
        let F3String = "\(Bobs_Flavor_3)"
        self.Bobs_Flavor3.text = F3String
        
        let Bobs_Flavor_4:AnyObject = obj["Flavor4"]
        let F4String = "\(Bobs_Flavor_4)"
        self.Bobs_Flavor4.text = F4String
        
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
        self.getBobsFlavors()

        // Do any additional setup after loading the view.
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
