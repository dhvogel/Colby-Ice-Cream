//
//  ClickCheck.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 4/10/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit


class ClickCheck: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setValue(UIFont(name: "Raleway-Light", size: 15), forKey: "font")
    }
    
    var reset:Bool = false
    
    //bool propety
    var isChecked:Bool = false{
        
        didSet{
            if isChecked == true{
                if (self.titleLabel!.text! == "Empty") {
                    self.backgroundColor = UIColor.redColor()
                    self.layer.borderColor = UIColor.redColor().CGColor
                    self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                }
                else if (self.titleLabel!.text! == "Other") {
                    self.backgroundColor = UIColor.grayColor()
                    self.layer.borderColor = UIColor.grayColor().CGColor
                    self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                }
                else {
                        self.backgroundColor = UIColor.greenColor()
                        self.layer.borderColor = UIColor.greenColor().CGColor
                        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                        self.layer.cornerRadius = 5
                        self.layer.borderWidth = 1
                        for (var i=0; i<flavors.count; i++) {
                            println(flavors[i])
                            if (flavors[i] == "nothing") {
                                flavors[i] = self.titleLabel!.text!
                                break
                            }
                        }
                    }
            }
            else{
                self.backgroundColor = UIColor.whiteColor()
                self.layer.borderColor = UIColor.blackColor().CGColor
                self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
                self.layer.cornerRadius = 5
                self.layer.borderWidth = 1
                let idx = find(flavors, self.titleForState(.Normal)!)
                if (idx != nil) {
                    flavors[idx!] = "nothing"
                }
            }
        }
    }
    
    
    func isFull() -> Bool {
        for (var i=0; i<flavors.count; i++) {
            if (flavors[i] == "nothing") {
                return false
            }
        }
        return true
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
        if contains(flavors,self.titleForState(.Normal)!) {
            reset = true
            isChecked = true
            reset = false
        }
        else {
            isChecked = false
        }
    }
    
    
    
    func buttonClicked(sender:UIButton) {
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                if (isFull()) {
                    let alert = UIAlertView()
                    alert.title = "Error"
                    alert.message = "Cannot select more than 4 flavors"
                    alert.addButtonWithTitle("OK")
                    alert.show()
                    return
                }
                else {
                    isChecked = true
                }
            }
        }
    }
    
}
