//
//  EmptyButton.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/14/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class EmptyButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.redColor()
        self.layer.borderColor = UIColor.redColor().CGColor
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
