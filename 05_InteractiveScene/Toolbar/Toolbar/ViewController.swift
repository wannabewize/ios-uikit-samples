//
// 툴자 예제
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 툴바 생성 - TODO : 오토레이아웃으로 작성
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: 44))
        
        // 이미지 기반의 바 버튼
        let image = UIImage(named: "button")! // 옵셔널
        let imageBarButton = UIBarButtonItem(image: image, style: UIBarButtonItemStyle.plain, target: self, action: #selector(handleImageButton(_:)))
        
        // 글자 기반의 바 버튼
        let textBarButton = UIBarButtonItem(title: "문자열 버튼", style: .plain, target: self, action: #selector(handleTextButton(_:)))
        
        // 여백
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        // 시스템 바 버튼
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone(_:))) // 문자열 만으로 셀렉터 객체 생성
        
        // 툴바에 아이템(바 버튼) 배열 설정
        toolbar.items = [imageBarButton, textBarButton, space, doneBarButton]
        
        // 뷰 구조에 추가
        self.view.addSubview(toolbar)
        
    }
    
    func handleImageButton(_ sender : Any) {
        print("이미지 버튼 누름")
    }
    
    func handleTextButton(_ sender : Any) {
        print("글자 버튼 누름")
    }
    
    // 셀렉터는 파라미터의 타입과 상관없다.
    func handleDone(_ sender : UIBarButtonItem) {
        print("완료 버튼 누름")
    }

}

