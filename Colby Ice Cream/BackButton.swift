//
//  BackButton.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/30/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class BackButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let backbutton = UIImage(named: "backButton")
        self.clipsToBounds = true
        self.layer.cornerRadius = 0.5 * self.bounds.size.width
        self.setImage(backbutton, forState: .Normal)
        
        
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
