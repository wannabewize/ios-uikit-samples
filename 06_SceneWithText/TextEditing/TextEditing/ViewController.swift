//
// 텍스트필드의 편집 이벤트
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // 엔터키로 사라짐
    @IBAction func textFieldDidEndOnExit(_ sender: AnyObject) {
    }
    
    // Editing Changed 이벤트
    @IBAction func textFieldEditingChanged(_ sender: AnyObject) {
        self.label.text = self.textField.text
    }
    
    // Editing Did Begin 이벤트와 연결
    @IBAction func textFieldEditingDidBegin(_ sender: AnyObject) {
        self.label.textColor = UIColor.blue
    }
    
    // Editing Did End 이벤트와 연결
    @IBAction func textFieldEditingEnd(_ sender: AnyObject) {
        self.label.textColor = UIColor.red
    }


}

