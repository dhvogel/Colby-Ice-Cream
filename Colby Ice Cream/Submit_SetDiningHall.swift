//
//  Submit_SetDiningHall.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit
public var Hall_Select:String! = ""
public var flavors:[String]! = Array(count: 4, repeatedValue: "nothing")

class Submit_SetDiningHall: UIViewController {
    
    let colorGen = ColorGenerator()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#99E1FF", hexBottom: "#04E6F7")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
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
