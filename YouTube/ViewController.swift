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
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        
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
        
        // Cell BG Color to Red
        cell.backgroundColor = UIColor.red
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

