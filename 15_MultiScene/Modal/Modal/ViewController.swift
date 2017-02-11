//
// 모달 씬 전환과 데이터 전달
// 델리게이트를 이용한 입력값 얻기
//

import UIKit

class ViewController: UIViewController, ModalActionDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MainScene"
    }
        
    // 모달 동작의 델리게이트 메소드 구현
    func completeModalAction(_ data: String!) {
        print("모달 동작 완료 : \(data)")
        self.textField.text = data
    }
    
    // 텍스트 필드
    @IBOutlet weak var textField: UITextField!

    // 코드로 세그웨이 동작시키기 - 세그웨이 연결된 상태에서만 동작
    @IBAction func showModal2(_ sender: Any) {
        self.performSegue(withIdentifier: "MODAL_SEGUE", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MODAL_SEGUE",
            let vc = segue.destination as? ModalViewController {
            vc.delegate = self
            vc.data = textField.text
        }
    }
    
    @IBAction func showModal3(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier:"MODAL_VC") as! ModalViewController
        // 델리게이트 객체 설정
        vc.delegate = self
        // 데이터 전달
        vc.data = textField.text
        self.present(vc, animated: true) { 
            print("Presented : \(self.presentedViewController!.title)")
        }
    }
}

