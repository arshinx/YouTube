//
//  VideoCell.swift
//  YouTube
//
//  Created by Arshin Jain on 4/27/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

// Add a super class for better code organization and style
class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// VideoCell
class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            titleLabel.text = video?.title // set title label
            if let imageName = video?.thumbnailImageName {
                thumbnailImageView.image = UIImage(named: imageName)
            }
            
            if let profileImageName = video?.channel?.profileImageName {
                userProfileImageView.image = UIImage(named: profileImageName)
            }
            
            if let channelName = video?.channel?.name, let numberOfViews = video?.numberOfViews {
                
                // Number Formatter
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                
                let subTitleText = "\(channelName) • \(numberFormatter.string(from: numberOfViews)!) views • 2 years ago "
                subTitleTextView.text = subTitleText
            }
        }
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
        
        // Scale Aspect Fill - Stetch to maintain original aspect ratio
        imageView.contentMode = .scaleAspectFill
        
        // Image stays Within Bounds
        imageView.clipsToBounds = true
        
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
        
        // Round Image
        imageView.layer.cornerRadius = 22 // half of width and height of frame
        imageView.layer.masksToBounds = true
        
        // return image view
        return imageView
        
    }()
    
    // Seperator
    let seperatorView : UIView = {
        
        // Initialize View
        let view = UIView()
        
        // Set BG Color to a lighter shade of gray
        view.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
        // return view with data
        return view
        
    }()
    
    // Title Label
    let titleLabel : UILabel = {
        
        // Init label()
        let label = UILabel()
        
        // Prevent Conversion of contraints
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Set Label Text
        label.text = "Taylor Swift - Blank Space"
        
        // Return Label
        return label
    }()
    
    // Sub Title Label
    let subTitleTextView : UITextView = {
        
        // Init
        let textView = UITextView()
        
        // Prevent Conversion of contraints
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set Text
        textView.text = "TaylorSwiftVEVO • 1,604,687,607 views • 2 years ago"
        
        // Proper Left Alignment to keep in line with Title Label
        textView.textContainerInset = UIEdgeInsetsMake(0, -4, 0, 0)
        
        // Light Gray Text
        textView.textColor = UIColor.lightGray
        
        // return textview
        return textView
    }()
    
    override func setupViews() {
        
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
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .top, relatedBy: .equal, toItem: titleLabel, attribute: .bottom, multiplier: 1, constant: 4))
        // Text View - Left Constraints
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .left, relatedBy: .equal, toItem: userProfileImageView, attribute: .right, multiplier: 1, constant: 8))
        // Text View - Right Constraints
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .right, relatedBy: .equal, toItem: thumbnailImageView, attribute: .right, multiplier: 1, constant: 0))
        // Text View - Height Constraints
        addConstraint(NSLayoutConstraint.init(item: subTitleTextView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 0, constant: 30))
    }
    
    
}


