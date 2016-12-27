//
// 액티비티 인데케이터와 스위치
//

import UIKit

class ViewController: UIViewController {

    // 액티비티 인디케이터의 아웃렛
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        indicator.hidesWhenStopped = true
    }
    
    // 스위치의 ValueChanged의 액션 메소드
    @IBAction func switchChanged(_ sender: AnyObject) {
        let onOffSwitch = sender as! UISwitch
        if onOffSwitch.isOn {
            indicator.startAnimating()
        }
        else {
            indicator.stopAnimating()
        }
    }
}

