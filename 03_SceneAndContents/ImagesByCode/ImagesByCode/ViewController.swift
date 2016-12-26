//
// 코드를 이용한 이미지 생성과 이미지 뷰
//

import UIKit

class ViewController: UIViewController {
    
    var imageView1 : UIImageView!
    var imageView2 : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 번들 배포 이미지 로딩
        if let image = UIImage(named: "cat1") {
            // 이미지의 크기에서 뷰 크기 설정
            imageView1 = UIImageView(image: image)
            imageView1.center = CGPoint(x: self.view.center.x, y: image.size.height / 2 + 20)
            self.view.addSubview(imageView1)
        }
        
        // 번들 배포 이미지의 경로를 이용해서 이미지 로딩
        if let path = Bundle.main.path(forResource: "cat2", ofType: "png"),
            let image = UIImage(contentsOfFile: path) {
            imageView2 = UIImageView(image: image)
            // 이미지 뷰 1 아래에 배치
            imageView2.center = CGPoint(x: self.view.center.x,
                                        y: imageView1.frame.origin.y + imageView1.frame.size.height + image.size.height / 2 + 5)
            self.view.addSubview(imageView2)
        }
        
        // 네트워크를 이용한 이미지 로딩
        let urlStr = "http://lorempixel.com/400/200/cats/"
        if let url = URL(string: urlStr),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data:data) {
            let imageView = UIImageView(image: image)
            imageView.center = CGPoint(x: self.view.center.x, y: imageView2.frame.origin.y + imageView2.frame.size.height + image.size.height / 2 + 5)
            self.view.addSubview(imageView)
        }
    }
}

