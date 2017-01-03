//
// 탭 기반의 씬 구조
//

import UIKit

class ViewController: UIViewController {
    
    // 텍스트필드 아웃렛 연결
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var label : UILabel!
    
    // 텍스트필드 - Did End On Exit 이벤트 연결
    @IBAction func textfieldDidEndOnExit(_ sender: AnyObject) {
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // 엔터로 편집 끝나면서, 공유 데이터 저장
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.sharedData = textField.text
    }
    
    // 씬 전환되면서 공유 데이터를 화면에 반영
    // viewWillAppear가 viewWillDisappear보다 먼저 동작하므로 viewDidAppear에 반영
    override func viewDidAppear(_ animated: Bool) {
        label.text = "Scene \(self.tabBarController!.selectedIndex)"
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        textField.text = appDelegate.sharedData
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

