//
// 내비게이션 기반의 씬 구조
//

import UIKit

class ViewController: UIViewController {

    // 세그웨이 실행으로 씬 전환
    @IBAction func showDetail2(_ sender: Any) {
        self.performSegue(withIdentifier: "PUSH_SEUGE", sender: nil)
    }
    
    // 세그웨이 없이 씬 전환
    @IBAction func showDetail3(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailViewController {
            // 상세씬으로 데이터 전달 방법
//            vc.data = "Input Data"
            
            self.navigationController?.pushViewController(vc, animated: true)
            // Adaptive 방식
//            self.show(vc, sender: nil)
        }
    }
}

