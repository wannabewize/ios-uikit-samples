//
// 텍스트필드
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let textField = UITextField(frame: CGRect(x:0, y:50, width:self.view.frame.size.width, height:50))
        self.view.addSubview(textField)
        
        // 폰트
        textField.font = UIFont.systemFont(ofSize: 20)
        // 둥근 사각형 테두리
        textField.borderStyle = UITextBorderStyle.roundedRect
        // 편집 상태가 되면 내용 삭제 버튼 활성화
        textField.clearsOnBeginEditing = true
        
        // 안내 문구
        textField.placeholder = "여기에 메일 주소를 입력하세요"
        // 키보드는 email 입력용
        textField.keyboardType = UIKeyboardType.emailAddress
        
        // 스펠링 체크 OFF
        textField.spellCheckingType = .yes
        // 자동 고치기 OFF
        textField.autocorrectionType = .no
        // 자동 대문자 변경 OFF
        textField.autocapitalizationType = .none
        
        // 엔터로 편집 상태 종료
        textField.addTarget(self, action: #selector(handleDidEnd), for: .editingDidEndOnExit)
    }
    
    func handleDidEnd() {
        print("did end")
    }
}

