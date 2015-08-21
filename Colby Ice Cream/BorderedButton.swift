//
//  BorderedButton.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/20/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class BorderedButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel!.font = UIFont(name: "Raleway", size:15)
        self.backgroundColor = UIColor.clearColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.layer.cornerRadius = 5
    }
}
