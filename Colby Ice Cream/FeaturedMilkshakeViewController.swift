//
//  FeaturedMilkshakeViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 12/27/15.
//  Copyright © 2015 Daniel Vogel. All rights reserved.
//

import Foundation

class FeaturedMilkshakeViewController: UIViewController {
    
    var shake:[[String]] = [[String]]()
    
    @IBOutlet weak var FeatShakeTitle: UILabel!
    @IBOutlet weak var FeatShakeName: UILabel!
    @IBOutlet weak var FeatShakeSubmitter: UILabel!
    override func viewDidLoad() {
        let colorGen = ColorGenerator()
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#c2f1e0", hexBottom: "#ffcb42")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        

        let screenBounds = UIScreen.mainScreen().bounds
        let toSubmitButton: UIButton = UIButton(frame: CGRect(x: screenBounds.width - 160, y: screenBounds.height - 40, width: 150, height: 30))
        toSubmitButton.addTarget(self, action: "toSubmitButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        toSubmitButton.titleLabel!.font = UIFont(name: "Raleway", size:15)
        toSubmitButton.backgroundColor = UIColor.clearColor()
        toSubmitButton.layer.borderWidth = 1
        toSubmitButton.layer.borderColor = UIColor.whiteColor().CGColor
        toSubmitButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        toSubmitButton.layer.cornerRadius = 5
        toSubmitButton.setTitle("Submit your own!", forState: UIControlState.Normal)
        self.view.addSubview(toSubmitButton)
        
        let backButton: BackButton = BackButton(frame: CGRect(x: screenBounds.width/2 - 15, y: 30, width: 30, height: 30))
        backButton.addTarget(self, action: "backButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(backButton)
        
        FeatShakeTitle.setValue(UIFont(name: "Raleway-SemiBold", size:18), forKey: "font")
        FeatShakeTitle.text = "Featured Shake of the Week"
        FeatShakeTitle.textColor = UIColor.whiteColor()
        
        FeatShakeName.setValue(UIFont(name: "Raleway", size:14), forKey: "font")
        FeatShakeName.text = "Name: Fetching..."
        FeatShakeName.textColor = UIColor.whiteColor()
        
        FeatShakeSubmitter.setValue(UIFont(name: "Raleway", size:14), forKey: "font")
        FeatShakeSubmitter.text = "Submitter: Fetching..."
        FeatShakeSubmitter.textColor = UIColor.whiteColor()
        
        
        self.queryShake()
        
    }
    
    func queryShake() {
        let query = PFQuery(className: "ShakeSubmit")
        query.whereKey("Featured", equalTo: true)
        query.orderByDescending("updatedAt")
        query.getFirstObjectInBackgroundWithBlock {(object, error) -> Void in
            if (object == nil) {
                let alertController = UIAlertController(title:"Error", message: "Could not retrieve shake of the week. Check connectivity.", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else {
                
                self.getIngredientsfromObject(object)
                
            }
        }
    }
    
    func getIngredientsfromObject(obj: PFObject!) {
        FeatShakeName.text = "Shake Name: \(obj.objectForKey("ShakeName") as! String)"
        FeatShakeSubmitter.text = "Submitted By: \(obj.objectForKey("ShakeSubmitter") as! String )"
        for ingredient in 1...8 {
            print(ingredient)
            shake.append([obj.objectForKey("Ingredient\(ingredient)") as! String, obj.objectForKey("Amount\(ingredient)") as! String])
        }
        print(shake)
        self.displayShake()
    }
    
    func displayShake() {
        let screenBounds = UIScreen.mainScreen().bounds
        let ingredtitle = UILabel(frame: CGRectMake(screenBounds.width/4-20, 170, screenBounds.width/2 - 5, 20))
        ingredtitle.setValue(UIFont(name: "Raleway", size:13), forKey: "font")
        let underlineAttribute = [NSUnderlineStyleAttributeName: NSUnderlineStyle.StyleSingle.rawValue]
        var underlineAttributedString = NSAttributedString(string: "Ingredient", attributes: underlineAttribute)
        ingredtitle.attributedText = underlineAttributedString
        ingredtitle.textColor = UIColor.whiteColor()
        self.view.addSubview(ingredtitle)
        
        let amounttitle = UILabel(frame: CGRectMake((screenBounds.width*3)/4 - 20, 170, screenBounds.width - 5, 20))
        amounttitle.setValue(UIFont(name: "Raleway", size:14), forKey: "font")
        underlineAttributedString = NSAttributedString(string: "Amount", attributes: underlineAttribute)
        amounttitle.attributedText = underlineAttributedString
        amounttitle.textColor = UIColor.whiteColor()
        self.view.addSubview(amounttitle)
        
        
        
        for i in 0...7 {
            let ycoord: CGFloat = 195 + CGFloat(i * 25)
        
            let ingredientLabel = UILabel(frame: CGRectMake(5, ycoord, screenBounds.width/2 - 5, 20))
            ingredientLabel.setValue(UIFont(name: "Raleway", size:12), forKey: "font")
            ingredientLabel.text = "\(i+1)) \(shake[i][0])"
            ingredientLabel.textColor = UIColor.whiteColor()
            self.view.addSubview(ingredientLabel)
            
            let amountLabel = UILabel(frame: CGRectMake(screenBounds.width/2, ycoord, screenBounds.width/2 - 5, 20))
            amountLabel.setValue(UIFont(name: "Raleway", size:12), forKey: "font")
            amountLabel.text = shake[i][1]
            amountLabel.textColor = UIColor.whiteColor()
            self.view.addSubview(amountLabel)

        }
    }
    
    
    func toSubmitButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("MilkshakeToMilkshakeSubmit", sender: sender)
    }
    
    func backButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("MilkshakeToMenu", sender: sender)
    }
}