//
//  CAGradientLayer.swift
//  Piano
//
//  Created by Admin on 7/8/16.
//  Copyright © 2016 AAkash. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    
    func turquoiseColor() -> CAGradientLayer {
        let colorBottom = UIColor(red: 194/255.0, green: 229/255.0, blue: 156/255.0, alpha: 1.0)
        let colorTop = UIColor(red: 100/255.0, green: 179/255.0, blue: 244/255.0, alpha: 1.0)

        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.CGColor, colorBottom.CGColor]
        gradientLayer.locations = [0.0, 1.0]

        return gradientLayer
    }
    
    func mainColor() -> CAGradientLayer {
        let colorBottom = UIColor(red: 72/255.0, green: 85/255.0, blue: 99/255.0, alpha: 1.0)
        let colorTop = UIColor(red: 41/255.0, green: 50/255.0, blue: 60/255.0, alpha: 1.0)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.CGColor, colorBottom.CGColor]
        gradientLayer.locations = [0.0, 1.0]

        return gradientLayer
    }
    
    func primaryColor() -> CAGradientLayer {
        let colorBottom = UIColor(red: 224/255.0, green: 234/255.0, blue: 252/255.0, alpha: 1.0)
        let colorTop = UIColor(red: 207/255.0, green: 222/255.0, blue: 243/255.0, alpha: 1.0)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.CGColor, colorBottom.CGColor]
        gradientLayer.locations = [0.0, 1.0]
        
        return gradientLayer
    }
}

