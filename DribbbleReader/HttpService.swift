//
//  HttpService.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit

class HttpService {
    class func getJSON(url: String, callback:((NSArray) -> Void)) {
        var nsURL = NSURL(string: url)!
        var session = NSURLSession.sharedSession()
        var task = session.dataTaskWithURL(nsURL, completionHandler: { data, response, error -> Void in
            
            if error != nil{
                println("error")
            }
            
            if data != nil {
                let jsonData = NSJSONSerialization.JSONObjectWithData( data, options: NSJSONReadingOptions.MutableContainers, error: nil) as! NSArray
                callback(jsonData)
            }
            
            session.invalidateAndCancel()
            
        })
        task.resume()
    }
}
