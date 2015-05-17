//
//  PageCollectionViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/17.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

struct Pages {
    var viewControllers:[UIViewController] = []
}

class PageCollectionViewController: UICollectionViewController {
    
    var pages:Pages = Pages(){
        didSet { self.collectionView?.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "PageCollectionViewCell")
        
        let page1 = UIViewController()
        page1.view.backgroundColor = UIColor.yellowColor()
        self.pages.viewControllers.append(page1)
        
        let page2 = UIViewController()
        page2.view.backgroundColor = UIColor.blueColor()
        self.pages.viewControllers.append(page2)
    }
    
    // MARK: - UICollectionViewDelegate
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pages.viewControllers.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("PageCollectionViewCell", forIndexPath: indexPath) as! UICollectionViewCell
        let view = self.pages.viewControllers[indexPath.row].view
        cell.contentView.addSubview(view)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var pageViewRect = self.view.bounds
        return CGSize(width: pageViewRect.width, height: pageViewRect.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0.0
    }
}