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
    
    @IBAction func backgroundTapped(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func viewOriginalPageTapped(_ sender: UIButton) {
//        let vc = WebViewController(nibName: "WebViewController", bundle: nil)
//        vc.pageUrl = pageUrl
//        
//        parentNavigationController.pushViewController(vc, animated: true)
        shareAlert()
    }
    
    func shareAlert(){
        let actionSheet:UIAlertController = UIAlertController(
            title:"Share this image",
            message: self.navigationItem.title,
            preferredStyle: UIAlertControllerStyle.actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
        }
        
        let twitter = UIAlertAction(title: "Twitter", style: .default) { (action) -> Void in
            self.tweetBtnAction()
        }
        
        let fb = UIAlertAction(title: "Facebook", style: .default) { (action) -> Void in
            self.fbBtnAction()
        }
        
        actionSheet.addAction(cancelAction)
        actionSheet.addAction(twitter)
        actionSheet.addAction(fb)
        
        present(actionSheet, animated: true, completion: nil)
    }
    
    func fbBtnAction(){
        let vc:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        let shareText:String = shotName + " by " + designerName
        //テキストを設定
        vc.setInitialText(shareText)
        vc.add(imageView.image)
        self.present(vc,animated:true,completion:nil)
    }
    
    func tweetBtnAction(){
        let vc:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        let shareText:String = shotName + " by " + designerName
        //テキストを設定
        vc.setInitialText(shareText)
        vc.add(imageView.image)
        self.present(vc,animated:true,completion:nil)
    }
}
