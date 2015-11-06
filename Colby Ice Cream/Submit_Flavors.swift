//
//  Submit_Flavors.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/22/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit
import Parse

class Submit_Flavors: UIViewController {

    
    @IBOutlet weak var Title_Label: UILabel!
    
    
    @IBOutlet weak var SubmitButton: Bold_Button!
    @IBOutlet weak var AP: ClickCheck!
    @IBOutlet weak var Flav1: UIButton!
    @IBOutlet weak var Flav2: UIButton!
    @IBOutlet weak var Flav3: UIButton!
    @IBOutlet weak var Flav4: UIButton!
    let colorGen = ColorGenerator()
    
    var newWordField: UITextField = UITextField()
    var nameEntered: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SubmitButton.layer.borderWidth = 1
        SubmitButton.layer.cornerRadius = 5
        SubmitButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        SubmitButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#99E1FF", hexBottom: "#04E6F7")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        Title_Label.text = Hall_Select
        
        var tempbutton: [UIButton] = [self.Flav1, self.Flav2, self.Flav3, self.Flav4]
        
        
        for (var i=0; i<flavors.count; i++) {
            if (flavors[i] == "Empty") {
                tempbutton[i].setTitle("Empty", forState: UIControlState.Normal)
                tempbutton[i].backgroundColor = UIColor.redColor()
                tempbutton[i].layer.borderColor = UIColor.redColor().CGColor
                tempbutton[i].setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)  
            }
            else if (flavors[i] == "Other") {
                tempbutton[i].setTitle("Other", forState: UIControlState.Normal)
                tempbutton[i].backgroundColor = UIColor.grayColor()
                tempbutton[i].layer.borderColor = UIColor.grayColor().CGColor
                tempbutton[i].setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            }
            else if (flavors[i] == "nothing") {
                tempbutton[i].setTitle("Flavor not selected", forState: UIControlState.Normal)
                tempbutton[i].backgroundColor = UIColor.whiteColor()
                tempbutton[i].layer.borderColor = UIColor.blackColor().CGColor
                tempbutton[i].setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            }
            else {
                tempbutton[i].setTitle(flavors[i], forState: UIControlState.Normal)
                tempbutton[i].backgroundColor = UIColor.greenColor()
                tempbutton[i].layer.borderColor = UIColor.greenColor().CGColor
                tempbutton[i].setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
                tempbutton[i].titleLabel!.font = UIFont(name: "Raleway-SemiBold", size:13)
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func addTextField(textField: UITextField!){
        // add the text field and make the result global
        textField.placeholder = "Name"
        self.newWordField = textField
    }
    
    func wordEntered(alert: UIAlertAction!){
        // store the new word
        self.nameEntered = newWordField.text!
    }
    
    
    @IBAction func SubmitFlavors(sender: AnyObject) {
        
        var isNull:Bool = false
        
        for (var i=0; i<flavors.count; i++) {
            if (flavors[i] == "nothing") {
                isNull = true
            }
        }
        
        
        if (isNull == false) {
            
            let name: String! = UserInfo.name
            let first_name:String! = UserInfo.first_name
            
            var msg = "You submitted "
            msg = msg + flavors[0] + ", "
            msg = msg + flavors[1] + ", "
            msg = msg + flavors[2] + ", and "
            msg = msg + flavors[3]
            msg = msg + " for " + Hall_Select
            
            let ICSubmission = PFObject(className:"ICSubmit")
            ICSubmission.setObject(Hall_Select, forKey: "DHall")
            ICSubmission.setObject(flavors[0], forKey: "Flavor1")
            ICSubmission.setObject(flavors[1], forKey: "Flavor2")
            ICSubmission.setObject(flavors[2], forKey: "Flavor3")
            ICSubmission.setObject(flavors[3], forKey: "Flavor4")
            ICSubmission.setObject(name, forKey: "submitted_name")
            ICSubmission.setObject(first_name, forKey: "submitted_FName")
            
            
            let loadingSpinner:UIActivityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            loadingSpinner.center = CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)
            loadingSpinner.startAnimating()
            self.view.addSubview(loadingSpinner)
            
            
            ICSubmission.saveInBackgroundWithBlock{
                (success, error) -> Void in
                
                if success == true {
                    let alertController = UIAlertController(title:"Thanks, " + first_name + "!", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                else {
                    let alertController = UIAlertController(title:"Error", message: "Please select 4 flavors", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
                loadingSpinner.stopAnimating()
                loadingSpinner.removeFromSuperview()
                flavors = ["nothing", "nothing", "nothing", "nothing"]
                
            }
        }
        else {
            let alertController = UIAlertController(title:"Error", message: "Please select 4 flavors", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    
    func setEmpty(button: UIButton, index: Int) {
        button.setTitle("Empty", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.redColor()
        button.layer.borderColor = UIColor.redColor().CGColor
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        flavors[index] = "Empty"
    }
    
    func setOther(button: UIButton, index:Int) {
        button.setTitle("Other", forState: UIControlState.Normal)
        button.backgroundColor = UIColor.grayColor()
        button.layer.borderColor = UIColor.grayColor().CGColor
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        flavors[index] = "Other"
    }
    
    @IBAction func Flav1Other(sender: AnyObject) {
        setOther(self.Flav1, index: 0)
    }
    
    @IBAction func Flav1Empty(sender: AnyObject) {
        setEmpty(self.Flav1, index: 0)
    }
    
    @IBAction func Flav2Other(sender: AnyObject) {
        setOther(self.Flav2, index: 1)
    }
    
    @IBAction func Flav2Empty(sender: AnyObject) {
        setEmpty(self.Flav2, index: 1)
    }
    
    @IBAction func Flav3Other(sender: AnyObject) {
        setOther(self.Flav3, index: 2)
    }
    
    @IBAction func Flav3Empty(sender: AnyObject) {
        setEmpty(self.Flav3, index: 2)
    }
    
    @IBAction func Flav4Other(sender: AnyObject) {
        setOther(self.Flav4, index: 3)
    }
    
    @IBAction func Flav4Empty(sender: AnyObject) {
        setEmpty(self.Flav4, index: 3)
    }
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
