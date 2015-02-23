//
//  DanaPickerViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 2/21/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class DanaPickerViewController: UIViewController,UIPickerViewDelegate {
    //MARK  -Outlets and properties
    let flavors = ["chocolate", "vanilla", "mint chocolate chip", "strawberry"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flavors.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return flavors[row]
    }
}
