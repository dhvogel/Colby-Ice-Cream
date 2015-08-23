//
//  ViewController.swift
//  UIPageViewController
//
//  Created by PJ Vea on 3/27/15.
//  Copyright (c) 2015 Vea Software. All rights reserved.
//

import UIKit

class Check_Flavors: UIViewController, UIPageViewControllerDataSource {
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageFlavors: NSArray!
    var Foss_Flavors: [String!] = ["Fetching...", "Fetching...", "Fetching...", "Fetching...", "Fetching...", "Fetching..."]
    var Bobs_Flavors: [String!] = ["Fetching...", "Fetching...", "Fetching...", "Fetching...", "Fetching...", "Fetching..."]
    var Dana_Flavors: [String!] = ["Fetching...", "Fetching...", "Fetching...", "Fetching...", "Fetching...", "Fetching..."]
    var Foss_Flavor1: String!
    var Foss_Flavor2: String!
    var Foss_Flavor3: String!
    var Foss_Flavor4: String!
    
    var Dana_Flavor1: String!
    var Dana_Flavor2: String!
    var Dana_Flavor3: String!
    var Dana_Flavor4: String!
    
    var Bobs_Flavor1: String!
    var Bobs_Flavor2: String!
    var Bobs_Flavor3: String!
    var Bobs_Flavor4: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.pageTitles = NSArray(objects: "Dana", "Bobs", "Foss")
        
        var query = PFQuery(className: "ICSubmit")
        query.whereKey("DHall", equalTo: "Foss")
        query.orderByDescending("createdAt")
        
        query.getFirstObjectInBackgroundWithBlock {(object, error) -> Void in
            if (object == nil) {
                let alertController = UIAlertController(title:"Error", message: "Could not retrieve Foss information", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else {
                
                self.getFlavorsfromObject(object, hall: "Foss")
                
                self.updateFlavors()
            }
        }
        
        query = PFQuery(className: "ICSubmit")
        query.whereKey("DHall", equalTo: "Dana")
        query.orderByDescending("createdAt")
        
        query.getFirstObjectInBackgroundWithBlock {(object, error) -> Void in
            if (object == nil) {
                let alertController = UIAlertController(title:"Error", message: "Could not retrieve Dana information", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else {
                
                self.getFlavorsfromObject(object, hall: "Dana")
                
                self.updateFlavors()
            }
        }
        
        query = PFQuery(className: "ICSubmit")
        query.whereKey("DHall", equalTo: "Bobs")
        query.orderByDescending("createdAt")
        
        query.getFirstObjectInBackgroundWithBlock {(object, error) -> Void in
            if (object == nil) {
                let alertController = UIAlertController(title:"Error", message: "Could not retrieve Bobs information", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            else {
                
                self.getFlavorsfromObject(object, hall: "Bobs")
                
                self.updateFlavors()
                
            }
            
            
        }
        
        
        self.updateFlavors()
        
        
    }
    
    func updateFlavors() -> Void {
        self.pageFlavors = NSArray(objects: self.Dana_Flavors, self.Bobs_Flavors, self.Foss_Flavors)
        
        for subview in self.view.subviews {
            if (subview.tag == 1) {
                subview.removeFromSuperview()
            }
        }
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        var startVC = self.viewControllerAtIndex(0) as CheckViewController
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 30, self.view.frame.width, self.view.frame.size.height - 60)
        
        self.pageViewController.view.tag = 1
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
    }
    
    func getFlavorsfromObject(obj: PFObject!, hall:String) -> Void {
        let Flavor_1:String! = obj["Flavor1"] as! String
        
        let Flavor_2:String! = obj["Flavor2"] as! String
        
        let Flavor_3:String! = obj["Flavor3"] as! String
        
        let Flavor_4:String! = obj["Flavor4"] as! String
        
        var name: String!
        let FName: String! = obj["submitted_FName"] as! String
        //name = FName + " " + LName[0]
        
        var dateUpdated = obj.updatedAt as NSDate
        var dateFormat = NSDateFormatter()
        dateFormat.dateFormat = "MMM d, h:mm a"
        let Time_Label: String = NSString(format: "%@", dateFormat.stringFromDate(dateUpdated)) as String
    
        var finArray: [String!] = [Flavor_1, Flavor_2, Flavor_3, Flavor_4, FName, Time_Label]
    
        if (hall=="Foss") {
            self.Foss_Flavors = finArray
        }
        else if (hall=="Dana") {
            self.Dana_Flavors = finArray
        }
        else if (hall=="Bobs") {
            self.Bobs_Flavors = finArray
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func restartAction(sender: AnyObject)
    {
        var startVC = self.viewControllerAtIndex(0) as CheckViewController
        var viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers(viewControllers as [AnyObject], direction: .Forward, animated: true, completion: nil)
    }
    
    func viewControllerAtIndex(index: Int) -> CheckViewController
    {
        if ((self.pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return CheckViewController()
        }
        
        var vc: CheckViewController = self.storyboard?.instantiateViewControllerWithIdentifier("CheckViewController") as! CheckViewController
        
        vc.flavors = self.pageFlavors[index] as! [String!]
        vc.titleText = self.pageTitles[index] as! String
        vc.pageIndex = index
        
        return vc
        
        
    }
    
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        
        var vc = viewController as! CheckViewController
        var index = vc.pageIndex as Int
        
        
        if (index == 0 || index == NSNotFound)
        {
            return nil
            
        }
        
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        var vc = viewController as! CheckViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound)
        {
            return nil
        }
        
        index++
        
        if (index == self.pageTitles.count)
        {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
}

