//
// 모달 씬 담당 뷰 컨트롤러
//

import UIKit

// 모달 동작 처리를 위한 델리게이트 프로토콜 - class 전용
protocol ModalActionDelegate : class {
    func completeModalAction(_ data : String!)
}

class ModalViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    // 델리게이트 - 프로토콜 타입을 weak로 선언하려고 - 클래스 전용 프로토콜로
    weak var delegate : ModalActionDelegate!
    
    // 다른 씬에게서 전달받은 데이터
    var data : String!
    // 데이터를 뷰에 반영
    override func viewWillAppear(_ animated: Bool) {
        textField.text = data
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // 뷰가 나타난 이후에 접근 가능
        print("Presented : \(self.presentingViewController!.title)")
    }
    
    // 완료 버튼 누르면 - 모달 종료
    @IBAction func handleDone(_ sender: Any) {
        // 델리게이트에게 내용 전달
        if delegate != nil {
            let data = textField.text
            delegate.completeModalAction(data)
        }
        
        self.dismiss(animated: true, completion: nil)
        // completion은 default value parameter로 생략 가능
//        self.dismiss(animated: true)
    }

    // 키보드 감추기 - Did End On Exit 이벤트 연결
    @IBAction func textfieldDidEndOnExit(_ sender: AnyObject) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "ModalScene"
    }

}
