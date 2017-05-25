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

// Extend UIVIew
extension UIView {
    
    // Add a simplified method to prevent repetition #DRY
    func addConstraintsWithFormat(format: String, views: UIView...) {
        
        var viewsDictionary = [String: UIView]()
        
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            
            // Prevent Conversion of contraints
            view.translatesAutoresizingMaskIntoConstraints = false
            
            viewsDictionary[key] = view
        }
        
        // Using default constraint add method
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDictionary))
        
    }
}

// Extend UIImage View
extension UIImageView {
    
    func loadImageUsingURLString(urlString: String) {
        
        let url = URL(string: urlString)
        
        image = nil
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                self.image = UIImage(data: data!) // display new images asynchronously
            }
        }).resume()
        
    }
}
