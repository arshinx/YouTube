//
//  Extensions.swift
//  YouTube
//
//  Created by Arshin Jain on 4/27/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

// Create Extension to Arrange Colors
extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
