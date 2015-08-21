//
//  AboutViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    let colorGen = ColorGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()

        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#2DCC70", hexBottom: "#F7D021")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
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
