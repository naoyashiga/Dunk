//
//  ImageModalViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/05/30.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit
import Social

class ImageModalViewController: UIViewController {
    var parentNavigationController = UINavigationController()
    var pageUrl = ""
    var shotName = ""
    var designerName = ""

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
//        let vc = WebViewController(nibName: "WebViewController", bundle: nil)
//        vc.pageUrl = pageUrl
//        
//        parentNavigationController.pushViewController(vc, animated: true)
        shareAlert()
    }
    
    func shareAlert(){
        
        let image = imageView.image
        let activityVC = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        self.presentViewController(activityVC, animated: true, completion: nil)
        
    }
}
