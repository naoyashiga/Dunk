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
        
        var popularShot = ShotCollectionViewController(nibName: "ShotCollectionViewController", bundle: nil)
        popularShot.title = "Popular"
        popularShot.API_URL = Config.POPULAR_URL
        popularShot.parentNavigationController = self.navigationController!
        controllerArray.append(popularShot)
        
        var recentShot = ShotCollectionViewController(nibName: "ShotCollectionViewController", bundle: nil)
        recentShot.title = "Recent"
        recentShot.API_URL = Config.RECENT_URL
//        controllerArray.append(recentShot)
        
        var gifShot = ShotCollectionViewController(nibName: "ShotCollectionViewController", bundle: nil)
        gifShot.title = "Gif"
        gifShot.API_URL = Config.GIF_URL
//        controllerArray.append(gifShot)
        
        var parameters: [CAPSPageMenuOption] = [
            .ScrollMenuBackgroundColor(UIColor.scrollMenuBackgroundColor()),
            .ViewBackgroundColor(UIColor.viewBackgroundColor()),
            .SelectionIndicatorColor(UIColor.selectionIndicatorColor()),
            .BottomMenuHairlineColor(UIColor.bottomMenuHairlineColor()),
            .SelectedMenuItemLabelColor(UIColor.selectedMenuItemLabelColor()),
            .UnselectedMenuItemLabelColor(UIColor.unselectedMenuItemLabelColor()),
            .SelectionIndicatorHeight(2.0),
            .MenuItemFont(UIFont(name: "HiraKakuProN-W6", size: 15.0)!),
            .MenuHeight(34.0),
            .MenuItemWidth(80.0),
            .MenuMargin(0.0),
            //            "useMenuLikeSegmentedControl": true,
            .MenuItemSeparatorRoundEdges(true),
            //            "enableHorizontalBounce": true,
            //            "scrollAnimationDurationOnMenuItemTap": 300,
            .CenterMenuItems(true)]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRectMake(0.0, 0.0, self.view.frame.width, self.view.frame.height), pageMenuOptions: parameters)
        
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
