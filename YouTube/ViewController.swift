//
//  ViewController.swift
//  YouTube
//
//  Created by Arshin Jain on 4/26/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Nav title to Home
        navigationItem.title = "Home"
        
        // Register Cell ID
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView?.backgroundColor = UIColor.white
    }
    
    // Number of items
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 5 // automate in future
    }
    
    // Return cell data
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // Create a reusable cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        
        return cell
    }
    
    // Set Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Screen Width (Stretchable per device) and fixed height of 200
        return CGSize.init(width: view.frame.width, height: 200)
    }
}

// New Class
class VideoCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    // Views
    
    // Thumbnail Image View
    let thumbnailImageView : UIImageView = {
        
        // initialize image view
        let imageView = UIImageView()
        
        // Set BG Color to blue
        imageView.backgroundColor = UIColor.blue
        
        // Set Image
        imageView.image = UIImage(named: "taylor_swift_blank_space")
        
        // return image view
        return imageView
    }()
    
    // User Profile Image View
    let userProfileImageView : UIImageView = {
        
        // initialize image view
        let imageView = UIImageView()
        
        // Set BG Color to blue
        imageView.backgroundColor = UIColor.green
        
        // Set Image
        imageView.image = UIImage(named: "taylor_swift_profile")
        
        // return image view
        return imageView
        
    }()
    
    // Seperator
    let seperatorView : UIView = {
        
        // Initialize View
        let view = UIView()
        
        // Set BG Color to blue
        view.backgroundColor = UIColor.black
        
        // return view with data
        return view
        
    }()
    
    // Title Label
    let titleLabel : UILabel = {
        
        // Init label()
        let label = UILabel()
        
        // Purple BG
        label.backgroundColor = UIColor.purple
        
        // Prevent Conversion of contraints
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Return Label
        return label
    }()
    
    // Sub Title Label
    let subTitleTextView : UITextView = {
        
        // Init
        let textView = UITextView()
        
        // BG Color
        textView.backgroundColor = UIColor.red
        
        // Prevent Conversion of contraints
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        // return textview
        return textView
    }()
    
    func setupViews() {
        
        // Add Thumbnail Image View to View hierarchy
        addSubview(thumbnailImageView)
        
        // Add Separator View to Hierarchy
        addSubview(seperatorView)
        
        // Add User Profile Image View to View hierarchy
        addSubview(userProfileImageView)
        
        // Add Title Label to View hierarchy
        addSubview(titleLabel)
        
        // Add Text View to View hierarchy
        addSubview(subTitleTextView)
        
        // Add Padding for Thumbnail Image View
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)

        // Combined Padding - Vertical
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-16-[v2(1)]|", views: thumbnailImageView, userProfileImageView, seperatorView)
        
        // Horizontal Padding for User Profile img View
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        // Add Padding for Separator
        addConstraintsWithFormat(format: "H:|[v0]|", views: seperatorView)
        
        // Title Label - Top Constraints
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .top, relatedBy: .equal, toItem: thumbnailImageView, attribute: .bottom, multiplier: 1, constant: 8))
        
        // Title Label - Left Constraints
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        
        // Title Label - Right Constraints
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        
        // Title Label - Height Constraints
        addConstraint(NSLayoutConstraint.init(item: titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
        
        // Sub Title Text View - Top Constraints
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 8))
        // Text View - Left Constraints
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        // Text View - Right Constraints
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        // Text View - Height Constraints
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 20))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

