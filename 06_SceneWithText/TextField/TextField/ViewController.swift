//
// 텍스트필드
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let textField = UITextField(frame: CGRect(x: 20, y: 50, width: 300, height: 50))
        // 안내 문구
        textField.placeholder = "여기에 메일 주소를 입력하세요"
        // 폰트
        textField.font = UIFont.systemFont(ofSize: 20)
        // 둥근 사각형 테두리
        textField.borderStyle = UITextBorderStyle.roundedRect
        // 편집 상태일 때 내용 삭제 버튼
        textField.clearsOnBeginEditing = true
        // URL 입력용 키보드
        textField.keyboardType = UIKeyboardType.URL
        // 부 구조에 추가
        self.view.addSubview(textField)
    }
}

