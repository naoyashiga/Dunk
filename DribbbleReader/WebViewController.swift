//
//  WebViewController.swift
//  DribbbleReader
//
//  Created by naoyashiga on 2015/06/03.
//  Copyright (c) 2015年 naoyashiga. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKUIDelegate {
    var parentNavigationController = UINavigationController()
    var wkWebView = WKWebView()
    var screenHeight: CGFloat = 0.0
    var screenWidth: CGFloat = 0.0
    var navigationBarHeight : CGFloat = 0.0
    var pageUrl = ""
    var pageTitle = ""
    
    let progressBarHeight: CGFloat = 2.0

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var progressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setElementSize()
        initWebView()
    }

    func setElementSize(){
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        
//        navigationBarHeight = parentNavigationController?.navigationBar.frame.size.height
        navigationBarHeight = 30
        
        screenHeight = self.view.bounds.height - statusBarHeight - navigationBarHeight
        screenWidth = self.view.bounds.width
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initWebView(){
//        wkWebView = WKWebView(frame: CGRectMake(0, 0, screenWidth, screenHeight))
//        wkWebView = WKWebView(frame: CGRectMake(0, 0, containerView.bounds.width, containerView.bounds.height))
        wkWebView = WKWebView(frame: containerView.bounds)
        print(containerView.bounds.width)
        print(containerView.bounds.height)
        
        wkWebView.allowsBackForwardNavigationGestures = true
        
        //監視対象の登録
//        wkWebView.addObserver(self, forKeyPath:"estimatedProgress", options:.New, context:nil)
        
        wkWebView.addObserver(self, forKeyPath:"canGoBack", options: .New, context: nil)
        wkWebView.addObserver(self, forKeyPath:"canGoForward", options: .New, context: nil)
        
        wkWebView.UIDelegate = self
        
        let detailUrl = NSURL(string: pageUrl)
        let detailUrlReq = NSURLRequest(URL: detailUrl!)
        wkWebView.loadRequest(detailUrlReq)
        
//        self.view.addSubview(wkWebView)
        containerView.addSubview(wkWebView)
    }
    
    @IBAction func goBackBtnTapped(sender: UIBarButtonItem) {
        wkWebView.goBack()
    }
    
    @IBAction func goForwardBtnTapped(sender: UIBarButtonItem) {
        wkWebView.goForward()
    }
    
//    func changeBtnStatus(btn:UIButton){
//        if btn.enabled {
//            btn.setTitleColor(UIColor.webViewMenuBtnEnabledColor(), forState: UIControlState.Normal)
//        }else{
//            btn.setTitleColor(UIColor.webViewMenuBtnDisabledColor(), forState: UIControlState.Normal)
//        }
//    }
    
    func fadeAnimation(duration:CFTimeInterval,fromValue:CGFloat,toValue:CGFloat,view:UIView?){
        let fadeAnimation:CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        fadeAnimation.duration = duration
        fadeAnimation.fromValue = fromValue
        fadeAnimation.toValue = toValue
        fadeAnimation.removedOnCompletion = false
        fadeAnimation.fillMode = kCAFillModeForwards
        view?.layer.addAnimation(fadeAnimation, forKey: nil)
    }
    
    func webView(webView: WKWebView, createWebViewWithConfiguration configuration: WKWebViewConfiguration, forNavigationAction navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
        //別タブを開くリンク対策 再度ページの読み込みをする
        if(navigationAction.targetFrame == nil){
            webView.loadRequest(navigationAction.request)
        }
        return nil
    }
    
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
    }
    
    deinit {
        wkWebView.removeObserver(self, forKeyPath: "estimatedProgress")
        wkWebView.removeObserver(self, forKeyPath: "canGoForward")
        wkWebView.removeObserver(self, forKeyPath: "canGoBack")
    }
    
    override func observeValueForKeyPath(keyPath:String?, ofObject object:AnyObject?, change:[String:AnyObject]?, context:UnsafeMutablePointer<Void>) {
        switch keyPath {
        case "estimatedProgress"?:
            if let progress = change![NSKeyValueChangeNewKey] as? Float {
                if progress == 1 {
                    fadeAnimation(0.3, fromValue: 1, toValue: 0, view: progressBar)
                }
            }
        case "title"?:
            if let title = change![NSKeyValueChangeNewKey] as? NSString {
                self.navigationItem.title = title as String
            }
        case "canGoForward"?:
            print("canGoForward")
            
//            var _menuView = self.view.viewWithTag(10)
//            var _forwardBtn = _menuView?.viewWithTag(2) as! UIButton
//            _forwardBtn.enabled = wkWebView!.canGoForward as Bool
//            changeBtnStatus(_forwardBtn)
            
        case "canGoBack"?:
            print("canGoBack")
            if wkWebView.canGoBack as Bool {
//                if let _menuView = self.view.viewWithTag(10) {
//                    //menuViewを追加済み
//                    fadeAnimation(0.4, fromValue: 0, toValue: 1, view: self.view.viewWithTag(10))
//                    
//                }else{
//                    var _forwardBtn = UIButton()
//                    _forwardBtn = menuView.viewWithTag(2) as! UIButton
//                    _forwardBtn.enabled = false
//                    changeBtnStatus(_forwardBtn)
//                    self.view.addSubview(menuView)
//                }
            }else{
//                fadeAnimation(0.4, fromValue: 1.0, toValue: 0, view: self.view.viewWithTag(10))
            }
        default:
            break
        }
    }
}
