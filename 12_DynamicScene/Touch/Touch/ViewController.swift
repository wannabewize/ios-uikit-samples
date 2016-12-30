//
// 터치
//

import UIKit

class ViewController: UIViewController {
    // 이미지 뷰 아웃렛
    @IBOutlet weak var imageView: UIImageView!
    // 이미지 내부 터치
    var holdingImage : Bool = false
    
    // 터치 시작
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: touch.view)
        
        print("touch at \(point)");
        
        if imageView.frame.contains(point) {
            holdingImage = true
            // 이미지 확대
            imageView.transform = imageView.transform.scaledBy(x: 1.1, y: 1.1)
        }
        else {
            holdingImage = false
        }
    }
    
    // 터치 이동
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if holdingImage {
            let touch = touches.first!
            let point = touch.location(in: touch.view)
            
            imageView.center = point
        }
    }
    
    // 터치 끝
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if holdingImage {
            // 원래 크기로 되돌리기
            imageView.transform = CGAffineTransform.identity
            holdingImage = false
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("Touch Cancalled")
    }
}

