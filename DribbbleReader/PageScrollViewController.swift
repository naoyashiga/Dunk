//
//  PageScrollViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/20.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

struct ScrollPages {
        var viewControllers:[UIViewController] = []
//    var viewControllers:[ShotViewController] = []
}

class PageScrollViewController: UIViewController {
    var pages = ScrollPages()

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.greenColor()
        self.pages.viewControllers.append(vc)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.grayColor()
        self.pages.viewControllers.append(vc2)
        
        vc.willMoveToParentViewController(self)
        self.addChildViewController(vc)
        scrollView.addSubview(vc.view)
        vc.didMoveToParentViewController(self)
        
        vc2.willMoveToParentViewController(self)
        self.addChildViewController(vc2)
        scrollView.addSubview(vc2.view)
        vc2.didMoveToParentViewController(self)

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
