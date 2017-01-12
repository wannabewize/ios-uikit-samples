//
//  ViewController.swift
//  InterAppCommunication
//
//  Created by Jaehoon Lee on 2016. 9. 30..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   @IBOutlet weak var label1: UILabel!
   @IBOutlet weak var label2: UILabel!
   
   var value1 : String? {
      get { return label1.text }
      set { label1.text = newValue }
   }
   
   var value2 : String? {
      get { return label2.text }
      set { label2.text = newValue }
   }
}

