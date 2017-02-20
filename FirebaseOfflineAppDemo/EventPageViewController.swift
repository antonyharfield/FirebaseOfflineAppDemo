//
//  EventPageViewController.swift
//  FirebaseStorageCache
//
//  Created by Ant on 20/02/2017.
//  Copyright © 2017 Apptitude. All rights reserved.
//

import UIKit
import WebKit

class EventPageViewController: UIViewController {

    var event: Event?
    
    @IBOutlet var loadingView: UIView!
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
