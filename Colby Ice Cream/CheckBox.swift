//
//  CheckBox.swift
//  checkbox
//
//  Created by kent on 9/27/14.
//  Copyright (c) 2014 kent. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    //images
    let checkedImage = UIImage(named: "Checked_Box")
    let unCheckedImage = UIImage(named: "Unchecked_Box")
    
    //bool propety
    var isChecked:Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, forState: .Normal)
                flavors.append(self.titleForState(.Normal)!)
            }
            else{
                self.setImage(unCheckedImage, forState: .Normal)
                let idx = find(flavors, self.titleForState(.Normal)!)
                if (idx != nil) {
                    flavors.removeAtIndex(idx!)
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.isChecked = false
    }
    
    
    
    func buttonClicked(sender:UIButton) {
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
    
}
