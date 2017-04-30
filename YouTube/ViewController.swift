//
//  ViewController.swift
//  Home Feed UI For YouTube
//  YouTube
//
//  Created by Arshin Jain on 4/26/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Nav title to Home
        navigationItem.title = "Home"
        // Disable Nav Bar Translucency
        navigationController?.navigationBar.isTranslucent = false
        
        // Add Navigation Title
        // Navigation Title Frame / Padding
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height)) // 32 = spacing
        // Navigation Title
        titleLabel.text = "Home"
        // Navigation Title Color
        titleLabel.textColor = UIColor.white
        // Navigation Title Font Size
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        // Nav Bar Color
        navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
        
        // Register Cell ID
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        // Have Thumbnail image (video cells) be properly visible
        collectionView?.contentInset = UIEdgeInsetsMake(50, 0, 0, 0)
        // Align Scroll
        collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
        
        // Coll. view bg to Whtie
        collectionView?.backgroundColor = UIColor.white
        
        setupMenuBar() // Setup Menu Bar
        setupNavBarButtons() // Seup Nav Bar Buttons
    }
    
    func setupNavBarButtons() {
        // Create Buttons
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch)) // Search Button
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon"), style: .plain, target: self, action: #selector(handleMore)) // More Button
        // Right Bar Buttons
        navigationItem.rightBarButtonItems = [searchBarButtonItem]
    }
    
    func handleSearch() {
        print("Search Button Pressed")
    }
    
    
    
    // Menu Bar Object
    let menuBar : MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    // Method to Set up Menu Bar
    private func setupMenuBar() {
        // Add Menu Bar to View Hierarchy
        view.addSubview(menuBar)
        // Add Horizontal Constraints - Menu Bar
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        // Add Vertical Constraints - Menu Bar
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
        
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
        
        // Calculate Cell height for 16:9 ratio
        let height = (view.frame.width - 16 - 16) * 9 / 16
        
        // Screen Width (Stretchable per device) and Height: calculated height based on aspect ratio (16:9) + constraints
        return CGSize.init(width: view.frame.width, height: height + 16 + 68)
    }
}

