//
//  ViewController.swift
//  AppOpener
//
//  Created by Jaehoon Lee on 2016. 9. 30..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBAction func openOtherApp(_ sender: AnyObject) {
        
        var urlComponent = URLComponents(string: "myScheme://com.vanillastep/")!
        // 퍼센트 인코딩도 해준다.
        let query1 = URLQueryItem(name: "value1", value: textField1.text)
        let query2 = URLQueryItem(name: "value2", value: textField2.text)
        
        urlComponent.queryItems = [query1, query2]
        
        let url = urlComponent.url!
        
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options:[:], completionHandler: nil)
        }
        else {
            print("Can not open")
        }
    }
}

