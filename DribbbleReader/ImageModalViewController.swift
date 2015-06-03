//
//  ImageModalViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/30.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit

class ImageModalViewController: UIViewController {
    var parentNavigationController = UINavigationController()
    var pageUrl = ""

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backgroundTapped(sender: UITapGestureRecognizer) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func viewOriginalPageTapped(sender: UIButton) {
        let vc = WebViewController(nibName: "WebViewController", bundle: nil)
        vc.pageUrl = pageUrl
        
        parentNavigationController.pushViewController(vc, animated: true)
    }
}
