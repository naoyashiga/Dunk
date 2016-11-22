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
    class func getJSON(_ url: String, callback:@escaping ((NSArray) -> Void)) {
        let nsURL = URL(string: url)!
        let session = URLSession.shared
        let task = session.dataTask(with: nsURL, completionHandler: { data, response, error -> Void in
            
            if error != nil{
                print("error")
            }
            
            if data != nil {
                let jsonData = (try! JSONSerialization.jsonObject( with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as! NSArray
                callback(jsonData)
            }
            
            session.invalidateAndCancel()
            
        })
        task.resume()
    }
}
