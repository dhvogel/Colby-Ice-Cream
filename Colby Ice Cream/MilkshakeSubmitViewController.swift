//
//  MilkshakeSubmitViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 12/27/15.
//  Copyright © 2015 Daniel Vogel. All rights reserved.
//

import Foundation

class MilkshakeSubmitViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var MilkshakeSubmitTitle: UILabel!
    @IBOutlet weak var MilkshakeSubmitDesc: UILabel!
    let screenBounds = UIScreen.mainScreen().bounds
    var addLabel : UILabel?
    var textTag : Int = 0
    var textFields = [UITextField]()
    
    
    override func viewDidLoad() {
        let colorGen = ColorGenerator()
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#ffc5d9", hexBottom: "#c1d1e0")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        let backButton: BackButton = BackButton(frame: CGRect(x: screenBounds.width/2 - 15, y: 30, width: 30, height: 30))
        backButton.addTarget(self, action: "backButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(backButton)
        
        MilkshakeSubmitTitle.setValue(UIFont(name: "Raleway-Light", size:18), forKey: "font")
        MilkshakeSubmitTitle.text = "Submit Your Shake Recipe!"
        MilkshakeSubmitTitle.textColor = UIColor.whiteColor()
        
        
        MilkshakeSubmitDesc.setValue(UIFont(name: "Raleway-Light", size:13), forKey: "font")
        MilkshakeSubmitDesc.text = "Want to see your favorite shake recipe featured? Submit it here!"
        MilkshakeSubmitDesc.textColor = UIColor.whiteColor()
        MilkshakeSubmitDesc.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        MilkshakeSubmitDesc.numberOfLines = 2
        
        
        let addFieldButton: UIButton = UIButton(frame: CGRect(x: screenBounds.width/2 - 15, y: 100, width: 30, height: 30))
        let addImage = UIImage(named: "plusIcon")
        addFieldButton.clipsToBounds = true
        addFieldButton.layer.cornerRadius = 0.5 * addFieldButton.bounds.size.width
        addFieldButton.setImage(addImage, forState: .Normal)
        addFieldButton.tag = 0
        addFieldButton.addTarget(self, action: "addFieldPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addFieldButton)
        
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
        let nameTextField = UITextField(frame: CGRectMake(5, 140, screenBounds.width - 10, 30))
        nameTextField.placeholder = "Name of Shake"
        nameTextField.font = UIFont.systemFontOfSize(15)
        nameTextField.borderStyle = UITextBorderStyle.RoundedRect
        nameTextField.autocorrectionType = UITextAutocorrectionType.No
        nameTextField.keyboardType = UIKeyboardType.Default
        nameTextField.returnKeyType = UIReturnKeyType.Done
        nameTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        nameTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        nameTextField.tag = textTag
        nameTextField.delegate = self
        textTag = textTag + 1
        self.textFields.append( nameTextField )
        self.view.addSubview(nameTextField)
        
        let submitterTextField = UITextField(frame: CGRectMake(5, 172, screenBounds.width - 10, 30))
        submitterTextField.placeholder = "Your Name"
        submitterTextField.font = UIFont.systemFontOfSize(15)
        submitterTextField.borderStyle = UITextBorderStyle.RoundedRect
        submitterTextField.autocorrectionType = UITextAutocorrectionType.No
        submitterTextField.keyboardType = UIKeyboardType.Default
        submitterTextField.returnKeyType = UIReturnKeyType.Done
        submitterTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        submitterTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        submitterTextField.tag = textTag
        submitterTextField.delegate = self
        textTag = textTag + 1
        self.textFields.append( submitterTextField )
        self.view.addSubview(submitterTextField)
        
        let submitMilkshakeButton: UIButton = UIButton(frame: CGRect(x: 5, y: screenBounds.height - 35, width: screenBounds.width - 10, height: 25))
        submitMilkshakeButton.backgroundColor = UIColor.clearColor()
        submitMilkshakeButton.layer.borderWidth = 1
        submitMilkshakeButton.layer.borderColor = UIColor.whiteColor().CGColor
        submitMilkshakeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        submitMilkshakeButton.layer.cornerRadius = 5
        submitMilkshakeButton.addTarget(self, action: "submitMilkshake:", forControlEvents: UIControlEvents.TouchUpInside)
        submitMilkshakeButton.setTitle("Submit Milkshake!", forState: UIControlState.Normal)
        submitMilkshakeButton.titleLabel!.font = UIFont(name: "Raleway", size:15)
        self.view.addSubview(submitMilkshakeButton)
        
        addFieldButton.sendActionsForControlEvents(UIControlEvents.TouchUpInside)
        
        //addFieldPressed()
        
    }
    
    func backButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("MilkshakeSubmitToMilkshake", sender: sender)
    }
    
    func addFieldPressed(sender: UIButton) {
        if (textTag > 17) {
            let alertController = UIAlertController(title:"Error", message: "You can submit a max of 8 ingredients", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return
        }
        let ycoord: CGFloat = 210 + CGFloat(sender.tag * 25)
        let ingredientTextField = UITextField(frame: CGRectMake(5, ycoord, screenBounds.width/2 - 5, 20))
        ingredientTextField.placeholder = "Ingredient \(sender.tag + 1)"
        ingredientTextField.font = UIFont.systemFontOfSize(12)
        ingredientTextField.borderStyle = UITextBorderStyle.RoundedRect
        ingredientTextField.autocorrectionType = UITextAutocorrectionType.No
        ingredientTextField.keyboardType = UIKeyboardType.Default
        ingredientTextField.returnKeyType = UIReturnKeyType.Done
        ingredientTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        ingredientTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        ingredientTextField.tag = textTag
        ingredientTextField.delegate = self
        textTag = textTag + 1
        self.textFields.append(ingredientTextField )
        self.view.addSubview(ingredientTextField)
        
        let amountTextField = UITextField(frame: CGRectMake(screenBounds.width/2, ycoord, screenBounds.width/2 - 5, 20))
        amountTextField.placeholder = "Amount (eg. 1 spoonful)"
        amountTextField.font = UIFont.systemFontOfSize(12)
        amountTextField.borderStyle = UITextBorderStyle.RoundedRect
        amountTextField.autocorrectionType = UITextAutocorrectionType.No
        amountTextField.keyboardType = UIKeyboardType.Default
        amountTextField.returnKeyType = UIReturnKeyType.Done
        amountTextField.clearButtonMode = UITextFieldViewMode.WhileEditing;
        amountTextField.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        amountTextField.tag = textTag
        amountTextField.delegate = self
        textTag = textTag + 1
        self.textFields.append( amountTextField )
        self.view.addSubview(amountTextField)
        
        sender.tag = sender.tag + 1
        
        let addFieldButton: UIButton = UIButton(frame: CGRect(x: screenBounds.width/2 - 15, y:ycoord + 25 , width: 30, height: 30))
        let addImage = UIImage(named: "plusIcon")
        addFieldButton.clipsToBounds = true
        addFieldButton.layer.cornerRadius = 0.5 * addFieldButton.bounds.size.width
        addFieldButton.setImage(addImage, forState: .Normal)
        addFieldButton.tag = sender.tag
        addFieldButton.addTarget(self, action: "addFieldPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(addFieldButton)
        sender.removeFromSuperview()
        
        addLabel?.removeFromSuperview()
        
        addLabel = UILabel(frame: CGRect(x: screenBounds.width/2 + 20, y: ycoord + 30, width: 120, height: 20))
        addLabel!.setValue(UIFont(name: "Raleway-Light", size:10), forKey: "font")
        addLabel!.text = "(add another ingredient)"
        addLabel!.textColor = UIColor.blackColor()
        
        self.view.addSubview(addLabel!)
        
        
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        let nextTag: NSInteger = textField.tag + 1;
        print(nextTag)
        // Try to find next responder
        if let nextResponder: UIResponder! = textField.superview!.viewWithTag(nextTag){
            nextResponder.becomeFirstResponder()
        }
        else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
        }
        return false // We do not want UITextField to insert line-breaks.
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func submitMilkshake(sender: UIButton) -> Bool {
        let title:String = self.textFieldForTag(0)!.text!
        if (title == "") {
            let alertController = UIAlertController(title:"Error", message: "Your shake must have a name", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            return false
        }
        let submitter:String = self.textFieldForTag(1)!.text!
        print(title)
        print(submitter)
        var recipe = [[String:String]]()
        for var tag=2; tag<textTag; tag+=2 {
            let ingredient:String = self.textFieldForTag(tag)!.text!
            let amount:String = self.textFieldForTag(tag+1)!.text!
            if ((ingredient == "" && amount != "") || (ingredient != "" && amount == "")) {
                let alertController = UIAlertController(title:"Error", message: "Every ingredient must have an amount", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
                return false
            }
            if (ingredient != "" && amount != "") {
                recipe.append(["ingredient":ingredient, "amount":amount])
            }
        }
 
        
        let ShakeSubmission = PFObject(className:"ShakeSubmit")
        ShakeSubmission.setObject(title, forKey: "ShakeName")
        ShakeSubmission.setObject(submitter, forKey: "ShakeSubmitter")
        for entry in 0...recipe.count-1 {
            ShakeSubmission.setObject(recipe[entry]["ingredient"]!, forKey: "Ingredient\(entry+1)")
            ShakeSubmission.setObject(recipe[entry]["amount"]!, forKey: "Amount\(entry+1)")
        }
        
        
        let loadingSpinner:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
        loadingSpinner.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)
        loadingSpinner.startAnimating()
        self.view.addSubview(loadingSpinner)
        
        ShakeSubmission.saveInBackgroundWithBlock{
            (success, error) -> Void in
            
            if success == true {
                let alertController = UIAlertController(title:"Thanks, " + submitter + "!", message: "Your shake recipe was submitted!", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else {
                let alertController = UIAlertController(title:"Error", message: "Could not submit shake recipe due to connectivity error", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            loadingSpinner.stopAnimating()
            loadingSpinner.removeFromSuperview()
            
            
        }
        return true
    }
    
    func textFieldForTag( tag: Int ) -> UITextField? {
        return self.textFields.filter({ $0.tag == tag }).first
    }
    
}