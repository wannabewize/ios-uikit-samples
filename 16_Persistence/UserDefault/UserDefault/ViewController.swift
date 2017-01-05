//
// 유저 디폴트
//

import UIKit

class ViewController: UIViewController {
    
    let BIRTHDAY_KEY = "BIRHTDAY"
    let NOTI_KEY = "NOTI"
    
    @IBOutlet weak var birthdayPicker: UIDatePicker!
    @IBOutlet weak var notiSwitch: UISwitch!

    @IBAction func saveSetting(_ sender: Any) {
        
        let setting = UserDefaults.standard
        
        // 유저 디폴트에 각 값들을 키-밸류 형태로 저장
        setting.set(birthdayPicker.date, forKey: BIRTHDAY_KEY)
        setting.set(notiSwitch.isOn, forKey: NOTI_KEY)

        // 저장
        setting.synchronize()
    }
    
    @IBAction func restoreSetting(_ sender: Any) {
        let setting = UserDefaults.standard
        
        // TODO 옵셔널 체크
        birthdayPicker.date = setting.object(forKey: BIRTHDAY_KEY) as! Date
        notiSwitch.isOn = setting.bool(forKey: NOTI_KEY)
    }
}

