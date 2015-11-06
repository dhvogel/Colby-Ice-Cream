//
//  Bold_Button.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/2/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class Bold_Button: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.titleLabel!.font = UIFont(name: "Raleway-SemiBold", size:15)
    }

}
