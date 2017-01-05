//
//  ViewController.swift
//  WebView
//
//  Created by Jaehoon Lee on 2017. 1. 4..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    // 엔터로 웹뷰 로딩
    @IBAction func didEndOnExit(_ sender: Any) {
        // http를 입력해야 한다.
        let urlStr = textField.text!
        loadWebview(urlStr)
    }
    
    @IBAction func showWeb(_ sender: Any) {
        let urlStr = textField.text!
        loadWebview(urlStr)
    }
    
    func loadWebview(_ url : String) {
        if let url = URL(string: url) {
            let request = URLRequest(url: url)
            webView.loadRequest(request)
        }
    }
    
    @IBAction func executeScript(_ sender: Any) {
        let script = "alert('Works!')"
        webView.stringByEvaluatingJavaScript(from: script)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadWebview("http://apple.com")
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        let dialog = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        self.present(dialog, animated: true)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        print("webViewDidFinishLoad")
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

