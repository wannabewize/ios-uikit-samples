//
// 버튼 이벤트와 이벤트 다루기 예제
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBAction func changeBlue(_ sender: Any) {
        // 버튼 클릭시 동작
        colorView.backgroundColor = UIColor.blue
    }
    
    @IBAction func changeGreen(_ sender: Any) {
        colorView.backgroundColor = UIColor.green
    }
    
    @IBAction func changeRed(_ sender: Any) {
        colorView.backgroundColor = UIColor.red
    }
}

