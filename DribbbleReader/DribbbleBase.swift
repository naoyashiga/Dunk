//
//  DribbbleBase.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation

class DribbbleBase {
    var id: Int
    
    init(data: NSDictionary){
        self.id = data["id"] as! Int
    }
}
