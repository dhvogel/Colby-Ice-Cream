//
//  Submit_SetDiningHall.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit
public var Hall_Select:String! = ""
public var flavors:[String]! = []

class Submit_SetDiningHall: UIViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func Press_Dana(sender: AnyObject) {
        Hall_Select = "Dana"
    }
    
    @IBAction func Press_Bobs(sender: AnyObject) {
        Hall_Select = "Bobs"
    }
    
    @IBAction func Press_Foss(sender: AnyObject) {
        Hall_Select = "Foss"
    }
    
    
    
//    @IBAction func stop(sender: AnyObject) {
        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
