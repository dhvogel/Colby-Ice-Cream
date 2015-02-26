//
//  Check_Foss.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/23/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Check_Foss: UIViewController {

    @IBOutlet weak var Foss_Flavor1: UILabel!
    
    @IBOutlet weak var Foss_Flavor2: UILabel!
    
    @IBOutlet weak var Foss_Flavor3: UILabel!
    
    @IBOutlet weak var Foss_Flavor4: UILabel!
    
    
    func getFossFlavors(){
        let query = PFQuery(className: "ICSubmit")
        query.whereKey("DHall", equalTo: "Foss")
        query.orderByDescending("createdAt")
        
        var obj = query.getFirstObject()
        
        let Foss_Flavor_1:AnyObject = obj["Flavor1"]
        let F1String = "\(Foss_Flavor_1)"
        self.Foss_Flavor1.text = F1String
        
        let Foss_Flavor_2:AnyObject = obj["Flavor2"]
        let F2String = "\(Foss_Flavor_2)"
        self.Foss_Flavor2.text = F2String
        
        let Foss_Flavor_3:AnyObject = obj["Flavor3"]
        let F3String = "\(Foss_Flavor_3)"
        self.Foss_Flavor3.text = F3String
        
        let Foss_Flavor_4:AnyObject = obj["Flavor4"]
        let F4String = "\(Foss_Flavor_4)"
        self.Foss_Flavor4.text = F4String
        
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.getFossFlavors()
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
