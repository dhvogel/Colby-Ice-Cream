//
//  CustomTextView.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class CustomTextView: UITextView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(UIFont(name: "Raleway-Light", size:15), forKey: "font")
    }

}
