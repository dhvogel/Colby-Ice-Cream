//
//  Bold_Label.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/2/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Bold_Label: UILabel {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(UIFont(name: "Raleway-SemiBold", size:15), forKey: "font")
    }

}
