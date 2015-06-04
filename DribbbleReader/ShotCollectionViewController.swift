//
//  ShotCollectionViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/22.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

let reuseIdentifier_Shot = "ShotCollectionViewCell"

class ShotCollectionViewController: UICollectionViewController{
    private var shots:[Shot] = [Shot]() {
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    private var cellWidth:CGFloat = 0.0
    private var cellHeight:CGFloat = 0.0
    
    private let cellVerticalMargin:CGFloat = 20.0
    private let cellHorizontalMargin:CGFloat = 20.0
    
    var API_URL = Config.SHOT_URL
    var parentNavigationController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.hexStr("ff0000", alpha: 1.0)
        
        cellWidth = self.view.bounds.width
        cellHeight = self.view.bounds.height / 2.5
        
        self.collectionView?.registerNib(UINib(nibName: "ShotCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier_Shot)
        
        DribbleObjectHandler.getShots(API_URL, callback: {(shots) -> Void in
            self.shots = shots
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shots.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier_Shot, forIndexPath: indexPath) as! ShotCollectionViewCell
        
        let shot = shots[indexPath.row]
        
        cell.imageView.sd_setImageWithURL(NSURL(string: shot.imageUrl)!)
        cell.designerIcon.sd_setImageWithURL(NSURL(string: shot.avatarUrl)!)
        
        cell.shotName.text = shot.shotName
        cell.designerName.text = shot.designerName
        cell.viewLabel.text = String(shot.shotCount)
        
        
//        cell.imageView.bounds = CGRectMake(0, 0, cellWidth, cellHeight)
//        cell.imageView.frame = cell.imageView.bounds
//        cell.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        
        
//        cell.animatedImageView.bounds = CGRectMake(0, 0, cellWidth, cellHeight)
//        cell.animatedImageView.frame = cell.animatedImageView.bounds
//        cell.animatedImageView.contentMode = UIViewContentMode.ScaleAspectFill
        
//        cell.contentView.backgroundColor = UIColor.yellowColor()
        
//        let imageLoadQueue = dispatch_queue_create("imageLoadQueue", nil)
//        
//        SDWebImageDownloader.sharedDownloader().downloadImageWithURL(
//            NSURL(string: shot.imageUrl),
//            options: SDWebImageDownloaderOptions.UseNSURLCache,
//            progress: nil,
//            completed: { (image: UIImage!, data: NSData!, error: NSError!, finished: Bool) -> Void in
//                if finished {
//                    dispatch_async(imageLoadQueue, {
//                        let animatedImage = FLAnimatedImage(animatedGIFData: data)
//                        if let animatedImage = animatedImage {
//                            dispatch_async(dispatch_get_main_queue(), {
//                                cell.animatedImageView.animatedImage = FLAnimatedImage(GIFData: data)
//                            })
//                        }
//                    })
//                }
//                
//        })
        
        //        DribbleObjectHandler.asyncLoadShotImage(shot, imageView: cell.imageView)
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: cellWidth - cellHorizontalMargin, height: cellHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return cellVerticalMargin
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier_Shot, forIndexPath: indexPath) as! ShotCollectionViewCell
        let shot = shots[indexPath.row]
//        var vc = ImageModalViewController(nibName: "ImageModalViewController", bundle: nil)
        var vc = DetailViewController(nibName: "DetailViewController", bundle: nil)
//        vc.modalPresentationStyle = .FullScreen
//        vc.modalTransitionStyle = .CrossDissolve
//        vc.parentNavigationController = parentNavigationController
//        vc.pageUrl = shot.htmlUrl
        
//        let downloadQueue = dispatch_queue_create("com.naoyashiga.processdownload", nil)
//        
//        dispatch_async(downloadQueue){
//            var data = NSData(contentsOfURL: NSURL(string: shot.imageUrl)!)
//            
//            var image: UIImage?
//            var sdImageView: UIImageView?
//            
//            if data != nil {
//                shot.imageData = data
//                image = UIImage(data: data!)!
//            }
//            
//            dispatch_async(dispatch_get_main_queue()){
//                vc.imageView.image = image
//            }
//        }
        
//        self.parentNavigationController.presentViewController(vc, animated: true, completion: nil)
//        self.parentNavigationController.pushViewController(vc, animated: true)
    }
}
