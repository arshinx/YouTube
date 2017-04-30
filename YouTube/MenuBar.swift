//
//  MenuBar.swift
//  YouTube
//
//  Created by Arshin Jain on 4/28/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

// Menu Bar
class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // Create a collection view
    lazy var collectionView : UICollectionView = {
        // layout
        let layout = UICollectionViewFlowLayout()
        // Collection View with layout
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // Set Coolection View BG Color to NavBar's red shade
        cv.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        // Set Data Source and Delegate
        cv.dataSource = self
        cv.delegate = self
        // Return Collection View
        return cv
    }()
    
    // Cell ID for reg.
    let cellId = "cellId"
    let imageNames = ["home", "trending", "descriptions", "account"] // Image Names as Array
    
    // Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Register
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        // Add Collection View to Hierarchy
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
    }
    
    // 4 Buttons
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    // Cell Selection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Create Cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        // Return Cell
        return cell
    }
    
    // Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return smaller cell
        return CGSize(width: frame.width / 4, height: frame.height)
    }
    
    // Remove inter-cell spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MenuCell class
class MenuCell : BaseCell {
    
    // Add ImageView
    let imageView: UIImageView = {
        let iv = UIImageView() // Init. imageView
        iv.image = UIImage(named: "home") // Image Name
        return iv // Return ImageView with Image Config
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(imageView) // ImageView to view hierarchy
        addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView) // Horizontal Constraints
        addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView) // Vertical   Constraints
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)) // Horizontal Center
        addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)) // Vertical Center
    }
}











