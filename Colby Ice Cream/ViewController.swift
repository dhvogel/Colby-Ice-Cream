//
//  ViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var Check_Flavors: UIButton!
    @IBOutlet weak var Submit_Flavors: UIButton!
    @IBOutlet weak var About: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Check_Flavors.setValue(UIFont(name: "Vacaciones", size: 15), forKey: "font")
        self.Submit_Flavors.setValue(UIFont(name: "Vacaciones", size: 15), forKey: "font")
        self.About.setValue(UIFont(name: "Vacaciones", size: 15), forKey: "font")
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showMessage() {
        let alertController = UIAlertController(title:"Dan's First App", message: "Colby Ice Cream", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    
}

