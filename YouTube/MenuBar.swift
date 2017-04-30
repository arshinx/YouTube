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
        // Set BG
        cell.backgroundColor = UIColor.blue
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
    
    override func setupViews() {
        super.setupViews()
        
        backgroundColor = UIColor.yellow // Set BG to yellow
    }
}











