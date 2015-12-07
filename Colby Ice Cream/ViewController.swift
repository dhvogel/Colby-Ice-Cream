//
//  ViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import Foundation
import Parse
import FBSDKCoreKit
import FBSDKShareKit

class ViewController: UIViewController {

    let colorGen = ColorGenerator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#FB6A87", hexBottom: "#FB88FF")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func shareLink(sender: AnyObject) {
        let content : FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentURL = NSURL(string: "https://appsto.re/us/5lQK9.i")
        content.contentTitle = "Colby Ice Cream"
        content.contentDescription = "Tell your friends about Colby Ice Cream!"
        FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func getDataFromUrl(url:NSURL, completion: ((data: NSData?, response: NSURLResponse?, error: NSError? ) -> Void)) {
        NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) in
            completion(data: data, response: response, error: error)
            }.resume()
    }
    
    func downloadImage(url: NSURL){
        print("Started downloading \"\(url.URLByDeletingPathExtension!.lastPathComponent!)\".")
        getDataFromUrl(url) { (data, response, error)  in
            dispatch_async(dispatch_get_main_queue()) { () -> Void in
                guard let data = data where error == nil else { return }
                print("Finished downloading \"\(url.URLByDeletingPathExtension!.lastPathComponent!)\".")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
}

