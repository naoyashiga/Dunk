//
//  Shot.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation

class Shot: DribbbleBase {
    var imageUrl: String!
    var imageData: NSData?
    
    override init(data: NSDictionary) {
        super.init(data: data)
        
        let images = data["images"] as! NSDictionary
        self.imageUrl = Utils.getStringFromJSON(images, key: "normal")
    }
}
