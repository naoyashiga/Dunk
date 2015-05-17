//
//  ShotViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

let reuseIdentifier_Shot = "ShotCell"

class ShotViewController: UICollectionViewController {
    var shots:[Shot] = [Shot]() {
        didSet{
            self.collectionView?.reloadData()
        }
    }
    
    var cellWidth:CGFloat?
    var cellHeight:CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cellWidth = self.view.bounds.width
        self.cellHeight = self.view.bounds.height / 2.5

        self.collectionView?.registerNib(UINib(nibName: "ShotCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier_Shot)
        
        
        DribbleObjectHandler.getShots(Config.SHOT_URL, callback: {(shots) -> Void in
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
        
        cell.imageView.bounds = CGRectMake(0, 0, self.cellWidth!, self.cellHeight!)
        cell.imageView.frame = cell.imageView.bounds
        cell.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        cell.contentView.backgroundColor = UIColor.yellowColor()
        
        cell.imageView.sd_setImageWithURL(NSURL(string: shot.imageUrl)!)
//        DribbleObjectHandler.asyncLoadShotImage(shot, imageView: cell.imageView)
    
        return cell
    }

    // MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.cellWidth!, height: self.cellHeight!)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
