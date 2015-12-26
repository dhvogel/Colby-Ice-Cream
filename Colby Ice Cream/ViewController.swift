//
//  ViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import Foundation
import Parse

class ViewController: UIViewController {

    let colorGen = ColorGenerator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#FB6A87", hexBottom: "#FB88FF")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

