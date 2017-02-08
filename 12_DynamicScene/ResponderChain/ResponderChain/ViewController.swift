//
//  ViewController.swift
//  ResponderChain
//
//  Created by Jaehoon Lee on 2017. 2. 8..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func handleButtonTouch(_ sender: UIButton) {
        print("handle Button Touch")
        if let next = sender.next {
            print("Next responder : \(next)")
        }
    }

    @IBAction func handleBottomControlTouch(_ sender: UIControl) {
        print("handle Bottom Control Touch")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

