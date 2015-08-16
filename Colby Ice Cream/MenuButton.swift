//
//  MenuButton.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/14/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class MenuButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(UIFont(name: "Raleway-Medium", size: 15), forKey: "font")
        self.backgroundColor = UIColor.clearColor()
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
