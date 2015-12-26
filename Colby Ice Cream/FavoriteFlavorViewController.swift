//
//  FavoriteFlavorViewController.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 12/26/15.
//  Copyright © 2015 Daniel Vogel. All rights reserved.
//

import Foundation

class FavoriteFlavorViewController: UIViewController {
    let colorGen = ColorGenerator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sexyLayer:CAGradientLayer
        sexyLayer = colorGen.gradientGenerator("#91d0d6", hexBottom: "#a9ee9e")
        sexyLayer.frame = view.frame
        
        self.view.layer.insertSublayer(sexyLayer, atIndex: 0)
        
        // Do any additional setup after loading the view.
    }

}