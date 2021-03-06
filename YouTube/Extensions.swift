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

// Create an image cache
let imageCache = NSCache<NSString, UIImage>()

// Extend UIImage View
class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    func loadImageUsingURLString(urlString: String) {
        
        imageUrlString = urlString
        let url = URL(string: urlString)
        image = nil
        
        // load images from cache - if stored / already loaded once
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!) // display new images asynchronously
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                
            }
        }).resume()
        
    }
}
