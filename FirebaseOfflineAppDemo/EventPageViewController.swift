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

class EventPageViewController: UIViewController {

    var event: Event?
    
    @IBOutlet var loadingView: UIView!
    @IBOutlet var webContainerView: UIView!
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
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
        webView.isHidden = true
        
        if let event = event, event.pageName != "" {
            let ref = Files.pageReference(pageName: event.pageName)
            
            FirebaseStorageCache.main.get(storageReference: ref, completion: { (data) in
                if let data = data {
                    self.webView.load(data, mimeType: "text/html", characterEncodingName: "utf-8", baseURL: URL(fileURLWithPath: ""))
                    self.webView.isHidden = false
                    self.loadingView.isHidden = true
                }
            })
            
        }
    }
    
}
