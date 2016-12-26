//
// 애셋과 애셋 내 이미지 셋 사용하기
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView1: UIImageView!

    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 셋의 이름 사용
        if let image1 = UIImage(named: "porche_718") {
            imageView1.image = image1
        }
        
        if let image2 = UIImage(named: "porsche-Macan") {
            imageView2.image = image2
        }
    }
}

