//
// 뷰의 컨텐트 타입, 클리핑
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    @IBOutlet weak var imageView4: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 확장자가 jpg는 생략할 수 없다.
        let image = UIImage(named: "cat.jpg")!
        
        // ScaleToFill 모드. 뷰의 비율이 깨진다.
        imageView1.image = image
        imageView1.contentMode = .scaleToFill
        
        // AspectFit 모드. 컨텐트의 비율 유지. 뷰의 배경이 보일 수도 있다.
        imageView2.image = image
        imageView2.contentMode = .scaleAspectFit
        
        // Clipping 모드 : 뷰의 범위 밖으로 컨텐트 출력이 안된다.
        // contentMode center는 컨텐트의 원래 크기 유지
        imageView3.image = image
        imageView3.contentMode = .center
        imageView3.clipsToBounds = true
        
        // Clipping 모드 off : 뷰의 범위 밖까지 컨텐트 출력됨.
        imageView4.image = image
        imageView4.contentMode = .center
        // clipping은 기본값이 false
        imageView4.clipsToBounds = false
    }
}

