//
//  MVDetailViewController.swift
//  MVDanTang
//
//  Created by 天景隆 on 2017/8/4.
//  Copyright © 2017年 天景隆. All rights reserved.
//

import UIKit
import SVProgressHUD

class MVDetailViewController: MVBaseViewController {

    var homeItem: MVHomeItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let webView = UIWebView(frame: view.bounds)
        // 自动对页面进行缩放以适应屏幕
        webView.scalesPageToFit = true
        webView.dataDetectorTypes = .all
        let url = URL(string: homeItem!.content_url!)
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        webView.delegate = self
        view.addSubview(webView)
        
        let myView: UIView = UIView()
        myView.frame = 
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MVDetailViewController: UIWebViewDelegate {
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.setStatus("正在加载...")
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
}




