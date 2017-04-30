//
//  Video.swift
//  YouTube
//
//  Created by Arshin Jain on 4/30/17.
//  Copyright © 2017 Arshin Jain. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
