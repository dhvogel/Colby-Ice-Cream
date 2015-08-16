//
//  LetterViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/14/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class LetterViewController: UIViewController {
    
    let colorGen = ColorGenerator()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#1AD6FD", hexBottom: "#1D62F0")
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
