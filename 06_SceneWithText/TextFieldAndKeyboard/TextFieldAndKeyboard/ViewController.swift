//
// 텍스트필드와 키보드
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        // 키보드 알림 감시 객체 등록 - 셀렉터
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: Notification.Name.UIKeyboardDidShow, object: nil)
        
        // 클로저를 이용한 알림 감시
        NotificationCenter.default.addObserver(forName: .UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (noti : Notification) in
            print("Keyboard Will Hide")
            // 뷰를 원래 위치로
            self.view.transform = CGAffineTransform.identity
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    func keyboardWillShow(_ noti : Notification) {
        print("Keyboard Will Show")
        
        // 알림 객체의 userInfo에서 키보드 정보 얻기
        if let rectObj = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            
            // 키보드 크기
            let keyboardRect = rectObj.cgRectValue
            
            print("keyboard Rect : \(keyboardRect)")
            
            // 최초 응답 객체 찾기
            let textField = findFirstResponder() as! UITextField

            // 편집중인 텍스트필드가 키보드에 가리는지 체크
            if keyboardRect.contains(textField.frame.origin) {
                print("키보드에 가림")
                let dy = keyboardRect.origin.y - textField.frame.origin.y - textField.frame.size.height - 10
                self.view.transform = CGAffineTransform.init(translationX: 0, y: dy)
            }
            else {
                print("키보드에 가리지 않음")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 탭 동작 인식기
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        // 씬의 배경 뷰에 탭 동작 인식기 등록
        self.view.addGestureRecognizer(gestureRecognizer)
    }
    
    func handleTap(_ gesture : UITapGestureRecognizer) {
        // 최초 응답 객체 찾기
        if let firstRespond = self.findFirstResponder() {
            firstRespond.resignFirstResponder()
        }
    }

    func findFirstResponder() -> UIResponder? {
        for v in self.view.subviews {
            if v.isFirstResponder {
                return (v as UIResponder)
            }
        }
        return nil
    }

}

