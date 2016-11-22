//
//  DribbbleObjectHandler.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import Foundation
import UIKit
//import WebImage

class DribbleObjectHandler {
    
    class func asyncLoadShotImage(_ shot: Shot, imageView: UIImageView){
        let downloadQueue = DispatchQueue(label: "com.naoyashiga.processdownload", attributes: [])
        
        downloadQueue.async{
            let data = try? Data(contentsOf: URL(string: shot.imageUrl)!)
            
            var image: UIImage?
//            var sdImageView: UIImageView?
          
            if data != nil {
                shot.imageData = data
                image = UIImage(data: data!)!
            }
            
//            imageView.sd_setImageWithURL(NSURL(string: shot.imageUrl)!)
            
            DispatchQueue.main.async{
                imageView.image = image
            }
        }
    }
    
    class func getShots(_ url: String, callback:@escaping (([Shot]) -> Void)){
        var shots = [Shot]()
        let url = url + "&access_token=" + Config.ACCESS_TOKEN
        
        HttpService.getJSON(url){ (jsonData) -> Void in
            
            for shotData in jsonData {
                let shot = Shot(data: shotData as! NSDictionary)
                shots.append(shot)
            }
          
          DispatchQueue.main.async(){
                    callback(shots)
          }
          
        }
    }
}
