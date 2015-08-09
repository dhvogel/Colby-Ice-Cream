//
//  LetterButton.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/16/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class LetterButton: UIButton {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.clipsToBounds = true
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.cyanColor().CGColor
        self.setTitleColor(UIColor.cyanColor(), forState: UIControlState.Normal)
        self.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size:15)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
