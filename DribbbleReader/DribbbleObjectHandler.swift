//
//  DribbbleObjectHandler.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit

class DribbleObjectHandler {
    
    class func asyncLoadShotImage(shot: Shot, imageView: UIImageView){
        let downloadQueue = dispatch_queue_create("com.naoyashiga.processdownload", nil)
        
        dispatch_async(downloadQueue){
            var data = NSData(contentsOfURL: NSURL(string: shot.imageUrl)!)
            
            var image: UIImage?
            
            if data != nil {
                shot.imageData = data
                image = UIImage(data: data!)!
            }
            
            dispatch_async(dispatch_get_main_queue()){
                imageView.image = image
            }
        }
    }
    
    class func getShots(url: String, callback:(([Shot]) -> Void)){
        var shots = [Shot]()
        var url = url + "?access_token=" + Config.ACCESS_TOKEN
        
        HttpService.getJSON(url){ (jsonData) -> Void in
            
            for shotData in jsonData {
                let shot = Shot(data: shotData as! NSDictionary)
                shots.append(shot)
            }
            
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0), { () -> Void in
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    callback(shots)
                })
            })
        }
    }
}