//
//  Utils.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit

public class Utils {
    
    public class func getStringFromJSON(data: NSDictionary, key: String) -> String{
//        let info: AnyObject? = data[key]
      
        if let info = data[key] as? String {
            return info
        }
        
        return ""
    }
}