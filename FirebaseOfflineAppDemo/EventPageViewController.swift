//
//  EventPageViewController.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit
import WebKit
import FirebaseStorageCache

class EventPageViewController: UIViewController, WKNavigationDelegate {

    var event: Event?
    
    @IBOutlet var loadingView: UIView!
    @IBOutlet var webContainerView: UIView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        webContainerView.addSubview(webView)
        webView.topAnchor.constraint(equalTo: webContainerView.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: webContainerView.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: webContainerView.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: webContainerView.trailingAnchor).isActive = true

        loadWebView()
    }
    
    func loadWebView() {
        
        loadingView.isHidden = false
        webContainerView.isHidden = true
        
        if let event = event, event.pageName != "" {
            
            title = event.title
            
            let ref = Files.pageReference(pageName: event.pageName)
            
            webView.loadHTML(storageReference: ref) { data in
                let pre = ["<!doctype html>",
                           "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
                           "<style>",
                           "body { margin: 8px; font-size: 15px; font-family: -apple-system } ",
                           "b { color: #039be5 } img { max-width: 100% } ",
                           "</style>"]
                var preData = pre.joined().data(using: .utf8) ?? Data()
                preData.append(data)
                return preData
            }
        }
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.webContainerView.isHidden = false
        self.loadingView.isHidden = true
    }
    
}
