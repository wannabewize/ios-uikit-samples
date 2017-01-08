//
//  TodoWithSQLite
//

import UIKit

class ComposeViewController: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  @IBOutlet weak var datePicker: UIDatePicker!
  
  // 취소 - 모달 닫기
  @IBAction func handleCancel(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  // 완료 - 델리게이트에게 완료, 모달 닫기
  @IBAction func handleDone(_ sender: Any) {
    // 모델을 이용해서 할일 저
    let todoTitle = textField.text
    let dueDate = datePicker.date
    TodoManager.shared.addTodo(title: todoTitle!, dueDate : dueDate)
    
    dismiss(animated: true)
  }
}
