//
//  Check_Flavors.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Check_Flavors: UIViewController {

    @IBOutlet weak var TestLabel2: UILabel!
    
    
    func getFlavors(){
        let query = PFQuery(className: "ICSubmit")
        query.orderByDescending("createdAt")
//        query.getFirstObjectInBackgroundWithBlock ({(object:AnyObject!, error:NSError!) in
//            if(error == nil){
//                var ObjtoStr:String = object["Input"] as String
//                self.TestLabel2.text = String(ObjtoStr)
//
//            }
//            else{
//                println("Error in retrieving \(error)")
//            }
//            
//        })
        var obj = query.getFirstObject()
        let Input:AnyObject = obj["Flavor1"]
        let stringRep = "\(Input)"
        println(Input)
        println(stringRep)
        
        self.TestLabel2.text = stringRep
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFlavors()
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
