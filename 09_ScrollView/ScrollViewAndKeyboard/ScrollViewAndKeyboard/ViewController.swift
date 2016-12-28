//
// 스크롤 뷰와 키보드 입력
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    // 텍스트필드 등이 포함된 뷰
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.keyboardDismissMode = .interactive

    }
    
    override func viewDidLayoutSubviews() {
        // 상하 스크롤이 발생하도록 콘텐트 크기를 설정
        scrollView.contentSize.height = scrollView.frame.height + 200
        var size = scrollView.frame.size
        size.height += 200
        contentView.frame.size = size
    }
 
    override func viewDidAppear(_ animated: Bool) {
        // 키보드가 나타나는 알람 - 옵저버 등록
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        // 키보드가 사라지는 알람 - 클로저
        NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (noti) in
            
            // 키보드의 콘텐트 영역을 원래대로
            self.scrollView.contentInset = UIEdgeInsets.zero
            self.scrollView.scrollIndicatorInsets = UIEdgeInsets.zero
        }
    }
    
    // UIKeyboardWillShowNotification 알림 발생시
    func keyboardWillShow(noti : NSNotification) {
        if let rectObj = noti.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            // 키보드 크기
            let keyboardRect = rectObj.cgRectValue
            print("keyboard : \(keyboardRect)")
            
            // 스크롤 뷰의 콘텐츠 표시 영역을 키보드의 높이만큼 제하기
            let inset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardRect.height, right: 0)
            scrollView.contentInset = inset
            scrollView.scrollIndicatorInsets = inset
            
            // 편집중인 텍스트 필드 찾기 - 스크롤 뷰의 자식 뷰에서 찾아야 한다.
            if let textField = findFirstResponder() as? UITextField {
                
                // 스크롤한 범위를 고려한 텍스트 필드의 위치, x는 무시, y만 사용
                let textFieldPoint = CGPoint(x: 0, y: textField.frame.origin.y - scrollView.contentOffset.y)
                
                // 키보드에 텍스트필드가 가리는지 체크
                if keyboardRect.contains(textFieldPoint) {
                    print("키보드에 가림")
                    // 텍스트 필드를 키보드 밖으로 보이도록 스크롤 할 거리
                    let dy = textFieldPoint.y - keyboardRect.origin.y + textField.frame.size.height
                    
                    // 스크롤 뷰의 컨텐츠 오프셋을 이용해서 스크롤
                    let newContentOffset = CGPoint(x: scrollView.contentOffset.x, y: scrollView.contentOffset.y + dy)
                    scrollView.setContentOffset(newContentOffset, animated: true)
                }
                else {
                    print("키보드에 가리지 않음")
                }
            }
        }
    }

    // 스크롤 뷰의 자식 뷰에서 최초 응답 객체 찾기
    func findFirstResponder() -> UIResponder? {
        for v in scrollView.subviews {
            if v.isFirstResponder {
                return (v as UIResponder)
            }
        }
        // 없으면 nil 반환
        return nil
    }
}

