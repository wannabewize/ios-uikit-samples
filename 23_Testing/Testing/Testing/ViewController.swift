//
//  ViewController.swift
//  Testing
//
//  Created by Jaehoon Lee on 2017. 2. 26..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var downButton: UIButton!
    
    var value = 5 {
        didSet {
            downButton.isEnabled = value > 0
            upButton.isEnabled = value < 10
            label.text = String(value)
        }
    }
    
    @IBAction func increaseValue() {
        value += 1
    }
    
    @IBAction func decreseValue() {
        value -= 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.text = String(value)
    }
}

