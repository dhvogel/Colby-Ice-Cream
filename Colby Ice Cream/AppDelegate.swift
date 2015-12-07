//
//  AppDelegate.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import ParseFacebookUtilsV4



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("96gTumILSjh1rxOTT5sWmiWwW992YC7jwIpEgiJt",
            clientKey: "qjIme7cY6Eq2ULooghd2DlAzWj5YCVCYcRVhRucc")
        PFAnalytics.trackAppOpenedWithLaunchOptionsInBackground(launchOptions, block: nil)
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        let defaultACL = PFACL()
        // If you would like all objects to be private by default, remove this line.
        defaultACL.setPublicReadAccess(true)
        PFACL.setDefaultACL(defaultACL, withAccessForCurrentUser: true)
        
        let pageControl = UIPageControl.appearance()
        pageControl.pageIndicatorTintColor = UIColor.lightGrayColor()
        pageControl.currentPageIndicatorTintColor = UIColor.blackColor()
        pageControl.backgroundColor = UIColor.whiteColor()
        
        //getAdmins()

        return FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, openURL: url, sourceApplication: sourceApplication, annotation: annotation)
    }
    
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
//        return FBSDKApplicationDelegate.
//    }
    
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func getAdmins() {
        let query:PFQuery = PFUser.query()!
        query.whereKey("Privilege", equalTo: "Administrator")
        query.whereKey("Added", equalTo: false)
        let roleQuery:PFQuery = PFRole.query()!
        roleQuery.whereKey("name", equalTo: "Administrator")
        query.findObjectsInBackgroundWithBlock{(objects, error) -> Void in
            if error == nil {
                roleQuery.getFirstObjectInBackgroundWithBlock{(object, error) -> Void in
                    if error != nil {
                        print("ERROR")
                        print(error)
                    }
                    let adminRole:PFRole = object as! PFRole
                    for user in objects! {
                        print(user)
                        adminRole.users.addObject(user)
                        user.setValue(true, forKey: "Added")
                        user.saveInBackground()
                    }
                    adminRole.saveEventually()
                }
            }
                    
            else {
                print("Error getting objects")
            }
        }
    }

}

