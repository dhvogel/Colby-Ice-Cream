//
//  CheckLabel.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class CheckLabel: UILabel {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.backgroundColor = UIColor.greenColor()
        self.layer.borderColor = UIColor.greenColor().CGColor
        self.textColor = UIColor.whiteColor()
        self.clipsToBounds = true
        self.setValue(UIFont(name: "Raleway-Light", size:15), forKey: "font")
        
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
