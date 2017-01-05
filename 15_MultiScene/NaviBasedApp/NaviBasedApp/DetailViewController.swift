//
// 내비게이션 기반의 씬 구조.
//

import UIKit

class DetailViewController: UIViewController {
    
    var data : String!
    
    @IBOutlet var label : UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        self.label.text = data
    }

    @IBAction func backToPrevious(_ sender: Any) {
        if let naviController = self.navigationController {
            naviController.popViewController(animated: true)
        }
    }
}
