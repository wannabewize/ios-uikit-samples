//
//  ComposeViewController.swift
//

import UIKit

class ComposeViewController: UIViewController {
   @IBOutlet weak var textField: UITextField!
   @IBOutlet weak var datePicker: UIDatePicker!
   
   @IBAction func handleDone(sender: Any) {
      self.dismiss(animated: true, completion: nil)

      let manager = TodoManager.shared
      manager.addTodo(title: textField.text!, dueDate: datePicker.date)
      
      // 저장된 내용을 다시 읽어오기
      manager.resolveAll()
   }
   
   @IBAction func handleCancel(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
   }
}
