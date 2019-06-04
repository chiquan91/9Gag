//
//  DetailViewController.swift
//  9Gag
//
//  Created by Quan Hoang on 6/5/19.
//  Copyright © 2019 smartapp. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    // MARK: - outlets
    
    // MARK: - vars
    var webView: WKWebView?
    var link: String?
    
    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.loadData()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.webView?.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 400)
    }
    
    // MARK: - setups
    private func setupViews() {
        self.title = self.link
        
        let webConfiguration = WKWebViewConfiguration()
        // Fix Fullscreen mode for video and autoplay
        webConfiguration.preferences.javaScriptEnabled = true
        webConfiguration.allowsInlineMediaPlayback = true
        
        let webView = WKWebView(frame: CGRect.zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        self.view.addSubview(webView)
        
        self.webView = webView
    }
    
    // MARK: - apis
    private func loadData() {
        guard let link = self.link, let url = URL(string: link) else { return }
        let request = URLRequest(url: url)
        self.webView?.load(request)
    }
    
    // MARK: - actions

}

// MARK: - WKWebView
extension DetailViewController: WKNavigationDelegate {
    
}
