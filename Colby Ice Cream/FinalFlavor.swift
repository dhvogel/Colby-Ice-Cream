//
//  FinalFlavor.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/12/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class FinalFlavor: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(UIFont(name: "Raleway-Light", size:15), forKey: "font")
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        if (self.titleLabel!.text! == "Flavor not selected") {
            self.layer.borderColor = UIColor.blackColor().CGColor
            self.backgroundColor = UIColor.whiteColor()
            self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            
        }
    }
                
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    
    func buttonClicked(sender:UIButton) {
        if(sender == self){
            self.setTitle("Flavor not selected", forState: UIControlState.Normal)
            self.backgroundColor = UIColor.whiteColor()
            self.layer.borderColor = UIColor.blackColor().CGColor
            self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            self.setValue(UIFont(name: "Raleway-Light", size: 15), forKey: "font")
            let idx = find(flavors, self.titleLabel!.text!)
            if (idx != nil) {
                flavors[idx!] = "nothing"
            }
        }
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
