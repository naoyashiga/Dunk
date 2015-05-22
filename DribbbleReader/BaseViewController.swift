//
//  BaseViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/22.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    var pageMenu : CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var controllerArray : [UIViewController] = []
        
        self.navigationItem.title = "Dunk"
        
        self.navigationController?.navigationBarHidden = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.navigationBarTitleTextColor()]
        self.navigationController?.navigationBar.barTintColor = UIColor.navigationBarBackgroundColor()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.translucent = false
        
        var shot = ShotCollectionViewController(nibName: "ShotCollectionViewController", bundle: nil)
        shot.title = "Popular"
        controllerArray.append(shot)
        
        var shot2 = ShotCollectionViewController(nibName: "ShotCollectionViewController", bundle: nil)
        shot2.title = "test2"
        controllerArray.append(shot2)
        
        var parameters: [String: AnyObject] = [
            "scrollMenuBackgroundColor": UIColor.scrollMenuBackgroundColor(),
            "viewBackgroundColor": UIColor.viewBackgroundColor(),
            "selectionIndicatorColor": UIColor.selectionIndicatorColor(),
            "bottomMenuHairlineColor": UIColor.bottomMenuHairlineColor(),
            "selectedMenuItemLabelColor": UIColor.selectedMenuItemLabelColor(),
            "unselectedMenuItemLabelColor": UIColor.unselectedMenuItemLabelColor(),
            "selectionIndicatorHeight": 2.0,
            "menuItemFont": UIFont(name: "HiraKakuProN-W6", size: 15.0)!,
            "menuHeight": 34.0,
            "menuItemWidth": 80.0,
            "menuMargin": 0.0,
            //            "useMenuLikeSegmentedControl": true,
            "menuItemSeparatorRoundEdges": true,
            //            "enableHorizontalBounce": true,
            //            "scrollAnimationDurationOnMenuItemTap": 300,
            "centerMenuItems": true]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), options: parameters)
        
        self.view.addSubview(pageMenu!.view)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
