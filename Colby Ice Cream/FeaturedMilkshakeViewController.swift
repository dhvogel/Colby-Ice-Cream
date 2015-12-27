//
//  FeaturedMilkshakeViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 12/27/15.
//  Copyright © 2015 Daniel Vogel. All rights reserved.
//

import Foundation

class FeaturedMilkshakeViewController: UIViewController {
    
    
    override func viewDidLoad() {
        let colorGen = ColorGenerator()
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#c2f2d0", hexBottom: "#6b3e26")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        

        let screenBounds = UIScreen.mainScreen().bounds
        let toSubmitButton: UIButton = UIButton(frame: CGRect(x: screenBounds.width - 160, y: screenBounds.height - 40, width: 150, height: 30))
        toSubmitButton.addTarget(self, action: "toSubmitButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        toSubmitButton.titleLabel!.font = UIFont(name: "Raleway", size:15)
        toSubmitButton.backgroundColor = UIColor.clearColor()
        toSubmitButton.layer.borderWidth = 1
        toSubmitButton.layer.borderColor = UIColor.whiteColor().CGColor
        toSubmitButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        toSubmitButton.layer.cornerRadius = 5
        toSubmitButton.setTitle("Submit your own!", forState: UIControlState.Normal)
        self.view.addSubview(toSubmitButton)
        
    }
    
    func toSubmitButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("MilkshakeToMilkshakeSubmit", sender: sender)
    }
}