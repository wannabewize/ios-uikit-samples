//
//  ComposeViewController.swift
//  TodoWithCoreData
//
//  Created by Jaehoon Lee on 2016. 9. 26..
//  Copyright © 2016년 Jaehoon Lee. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {
   @IBOutlet weak var textField: UITextField!
   @IBOutlet weak var datePicker: UIDatePicker!
   
   @IBAction func handleDone(sender: AnyObject) {
      self.dismiss(animated: true, completion: nil)

      let manager = TodoManager.shared
      manager.add(title: textField.text!, due: datePicker.date)
      
      // 저장된 내용을 다시 읽어오기
      manager.resolveAll()
   }
   
   @IBAction func handleCancel(sender: AnyObject) {
      self.dismiss(animated: true, completion: nil)
   }
}
