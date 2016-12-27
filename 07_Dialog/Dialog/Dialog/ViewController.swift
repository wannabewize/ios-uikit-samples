//
// 얼럿 컨트롤러를 이용한 다이얼로그 작성
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputLabel: UILabel!
    
    @IBAction func showAlertView(_ sender: Any) {
        let dialog = UIAlertController(title: "계속 진행하겠습니까?", message: "이 곳에 메세지 입력", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action : UIAlertAction) -> Void in
            print("취소 선택")
        }
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            print("확인 선택")
        }
        
        dialog.addAction(cancelAction)
        dialog.addAction(okAction)
        
        self.present(dialog, animated: true, completion: nil)
    }
    
    @IBAction func showAlertViewWithTextInput(sender: AnyObject) {
        let dialog = UIAlertController(title: "비밀 번호 입력", message: nil, preferredStyle: .alert)
        
        
        let okAction = UIAlertAction(title: "확인", style: .default) { (action) in
            let userInput = dialog.textFields![0]
            self.inputLabel.text = userInput.text
        }
        dialog.addAction(okAction)
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action) in
            print("취소 선택")
            self.inputLabel.text = "취소 선택"
        }
        dialog.addAction(cancelAction)
        
        dialog.addTextField(configurationHandler: { (textField : UITextField) in
            // 키보드 설정
            textField.keyboardType = .numberPad
            textField.isSecureTextEntry = true

        })
        
        self.present(dialog, animated: true, completion: nil)
    }
    
    @IBAction func showAutocloseAlert(_ sender: Any) {
        let dialog = UIAlertController(title: "자동 종료", message: "이 메세지는 3초뒤 자동으로 사라집니다.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        dialog.addAction(okAction)
        
        self.present(dialog, animated: true, completion: nil)
        // 타이머를 이용해서 3초뒤 닫기
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: { (timer : Timer) in
            dialog.dismiss(animated: true, completion: nil)
//            if let dialog = self.presentedViewController as? UIAlertController {
//                // 모달로 나타난 얼럿 뷰 컨트롤러 종료
//                dialog.dismiss(animated: true, completion: nil)
//            }
        })
    }
    
    @IBAction func showActionSheet(_ sender: Any) {
        let dialog = UIAlertController(title: "액션시트", message: "메세지", preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { (action) in
            print("삭제 선택")
        }
        dialog.addAction(deleteAction)
        
        
        let otherAction = UIAlertAction(title: "다른 선택", style: .default) { (action) in
            print("다른 선택!")
        }
        dialog.addAction(otherAction)
        
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { (action) in
            print("취소 선택")
        }
        dialog.addAction(cancelAction)
        
        self.present(dialog, animated: true, completion: nil)
    }
}

