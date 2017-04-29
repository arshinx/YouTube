//
//  MenuBar.swift
//  YouTube
//
//  Created by Arshin Jain on 4/28/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

// Menu Bar
class MenuBar: UIView {
    
    // Create a collection view
    let collectionView : UICollectionView = {
        // layout
        let layout = UICollectionViewFlowLayout()
        // Collection View with layout
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        // Return Collection View
        return cv
    }()
    
    // Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add Collection View to Hierarchy
        addSubview(collectionView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        // Set Coolection View BG Color to NavBar's red shade
        collectionView.backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
