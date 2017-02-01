//
//  ViewController.swift
//  TextFieldAndFirstResponder
//
//  Created by wannabewize on 2017. 2. 2..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func switchFirstResponder(_ sender: UISwitch) {
        if sender.isOn {
            textField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
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

