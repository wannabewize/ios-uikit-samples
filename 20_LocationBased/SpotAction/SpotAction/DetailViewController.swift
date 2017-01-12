//
//  DetailViewController.swift
//  SpotAction
//
//  Created by wannabewize on 2015. 3. 27..
//  Copyright (c) 2015년 wannabewize. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var urlStr : String!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewWillAppear(_ animated: Bool) {
        if let url = URL(string: urlStr) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    @IBAction func dismissModal(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
}
