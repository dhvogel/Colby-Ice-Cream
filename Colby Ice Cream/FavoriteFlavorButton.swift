//
//  FavoriteFlavorButton.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 12/26/15.
//  Copyright © 2015 Daniel Vogel. All rights reserved.
//

import Foundation

class FavoriteFlavorButton: UIButton {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(UIFont(name: "Raleway-Light", size: 15), forKey: "font")
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        print("test")
        setUp()
        
    }
    init(){
        super.init(frame: CGRectZero)
        setUp()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    func setUp(){
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 1
        self.backgroundColor = UIColor.whiteColor()
        self.layer.borderColor = UIColor.blackColor().CGColor
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        let strArray = PFInstallation.currentInstallation().channels! as! [String]
        print(strArray.contains(self.titleLabel!.text!))
        //if (strArray.contains(self.titleLabel!.text!)) {
        //    print(self.titleLabel!.text!)
        //}
    }

}
