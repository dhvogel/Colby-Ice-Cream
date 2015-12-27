//
//  FavoriteFlavorViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 12/26/15.
//  Copyright © 2015 Daniel Vogel. All rights reserved.
//

import Foundation

import UIKit

class FavoriteFlavorViewController: UIViewController, UIScrollViewDelegate {
    
    
    var scrollView: UIScrollView!
    var containerView = UIView()
    @IBOutlet weak var favoriteDesc: UILabel!
    
    @IBOutlet weak var favoriteLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        self.scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width, 2000)
        
        containerView = UIView()
        
        let colorGen = ColorGenerator()
        
        scrollView.addSubview(containerView)
        view.addSubview(scrollView)
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#73E6E4", hexBottom: "#FFF7D9")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        let screenBounds = UIScreen.mainScreen().bounds
        
        let backButton: BackButton = BackButton(frame: CGRect(x: screenBounds.width/2 - 15, y: 30, width: 30, height: 30))
        backButton.addTarget(self, action: "backButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(backButton)
        
        
        favoriteLabel.setValue(UIFont(name: "Raleway-Light", size:18), forKey: "font")
        favoriteLabel.text = "Select Your Favorite Flavors!"
        favoriteLabel.textColor = UIColor.whiteColor()
        containerView.addSubview(favoriteLabel)

        
        favoriteDesc.setValue(UIFont(name: "Raleway-Light", size:13), forKey: "font")
        
        containerView.addSubview(favoriteDesc)
        //favoriteDesc.autoresizingMask = [UIViewAutoresizing.FlexibleLeftMargin, UIViewAutoresizing.FlexibleRightMargin, UIViewAutoresizing.FlexibleTopMargin, UIViewAutoresizing.FlexibleBottomMargin]
        
        favoriteDesc.text = "Tap flavors to get notified whenever they are reported!"
        favoriteDesc.textColor = UIColor.whiteColor()
        favoriteDesc.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        favoriteDesc.numberOfLines = 2
        
        createFlavorButtons()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = view.bounds
        containerView.frame = CGRectMake(0, 0, scrollView.contentSize.width, scrollView.contentSize.height)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func createFlavorButtons() {
        let flavorArray = ["Apple Pie", "Appalachian Trail", "Black Raspberry", "Butter Pecan", "Cherry Vanilla", "Chocolate Peanut Butter Cup", "Cake Batter", "Camp Coffee", "Campfire S'mores", "Caramel Caribou", "Chocolate Chip", "Chocolate Lover's Chocolate", "Chocolate Toasted Coconut", "Cookie Dough", "Cookies N' Cream", "Fly Fishing Fudge", "French Vanilla", "Golden Road Butter Brickle", "Grapenuts with Vanilla", "Maine Black Bear", "Maine Deer Tracks", "Maine Lobster Tracks", "Maine Maple Walnut", "Maine Wild Blueberry", "Mango Sorbet", "Mint Chocolate Chip", "Moose Tracks", "Mt Katahdin Crunch", "Old Fashioned Vanilla", "Orange Sherbert", "Peanut Butter Cup", "Peanut Butter Pie", "Pink Peppermint Stick", "Pistachio Nut", "Pumpkin", "Rainbow Sherbert", "Red Raspberry Sorbet", "Strawberry", "Sugarloaf Mint Chip", "Sweet and Salty Pretzel", "Toasted Coconut", "Vanilla Bean", "Vanilla with Red Raspberry", "World's Best Chocolate"]
        
        let strArray = PFInstallation.currentInstallation().channels! as! [String]

        
        var buttonY = 200;

        for flavor in flavorArray {
            buttonY = buttonY + 40
            let flavorButton: UIButton = UIButton(frame: CGRect(x: 5, y: buttonY, width: Int(UIScreen.mainScreen().bounds.width - 10), height: 30))
            flavorButton.layer.cornerRadius = 10;
            flavorButton.layer.borderWidth = 1
            if (strArray.contains(flavor.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("'", withString: ""))) {
                flavorButton.backgroundColor = UIColor.blueColor()
                flavorButton.layer.borderColor = UIColor.blueColor().CGColor
                flavorButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
              // we are going to space these UIButtons 50px apart
            } else {
                flavorButton.backgroundColor = UIColor.whiteColor()
                flavorButton.layer.borderColor = UIColor.blackColor().CGColor
                flavorButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            }
            flavorButton.setTitle("\(flavor)", forState: UIControlState.Normal) // We are going to use the item name as the Button Title here.
            flavorButton.titleLabel?.text = "\(flavor)"
            flavorButton.addTarget(self, action: "flavorButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
            
            containerView.addSubview(flavorButton)  // myView in this case is the view you want these buttons added
        }
    }
    
    func flavorButtonPressed(sender: UIButton) {
        if (sender.backgroundColor == UIColor.whiteColor()) {
            sender.backgroundColor = UIColor.blueColor()
            sender.layer.borderColor = UIColor.blueColor().CGColor
            sender.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.addUniqueObject(sender.titleLabel!.text!.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("'", withString: ""), forKey: "channels")
            currentInstallation.saveInBackground()
        } else {
            sender.backgroundColor = UIColor.whiteColor()
            sender.layer.borderColor = UIColor.blackColor().CGColor
            sender.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
            let currentInstallation = PFInstallation.currentInstallation()
            currentInstallation.removeObject(sender.titleLabel!.text!.stringByReplacingOccurrencesOfString(" ", withString: "").stringByReplacingOccurrencesOfString("'", withString: ""), forKey: "channels")
            currentInstallation.saveInBackground()
        }
        print(PFInstallation.currentInstallation().channels!)
    }
    
    func backButtonPressed(sender: UIButton) {
        performSegueWithIdentifier("FavoriteToMenu", sender: sender)
    }
    
    
}