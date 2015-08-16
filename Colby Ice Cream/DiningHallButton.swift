//
//  DiningHallButton.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/16/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class DiningHallButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = true
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.backgroundColor = UIColor.clearColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size:20)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
