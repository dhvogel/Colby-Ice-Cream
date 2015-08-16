//
//  ColorGenerator.swift
//  Colby Ice Cream
//
//  Created by Daniel Vogel on 8/14/15.
//  Copyright (c) 2015 Daniel Vogel. All rights reserved.
//

import UIKit

class ColorGenerator: UIColor {
   
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet() as NSCharacterSet).uppercaseString
        
        if (cString.hasPrefix("#")) {
            cString = cString.substringFromIndex(advance(cString.startIndex, 1))
        }
        
        if (count(cString) != 6) {
            return UIColor.grayColor()
        }
        
        var rgbValue:UInt32 = 0
        NSScanner(string: cString).scanHexInt(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func gradientGenerator(hexTop:String, hexBottom:String) -> CAGradientLayer {
        let colorTop = hexStringToUIColor(hexTop).CGColor
        let colorBottom = hexStringToUIColor(hexBottom).CGColor
        
        let gl: CAGradientLayer
        gl = CAGradientLayer()
        gl.colors = [colorTop, colorBottom]
        gl.locations = [0.0, 1.0]
        
        return gl
    }
}
