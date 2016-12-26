//
// 리소스 파일 다루기
// 기기 배율에 맞춰서 이미지가 자동으로 선택된다.
// 이미지 파일을 담은 폴더 추가 옵션에 따라서 파일 접근 방법이 달라진다.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create group로 추가한 폴더 내 이미지는 파일 이름으로 접근. png 확장자 생략 가능
        if let image1 = UIImage(named: "image") {
            imageView1.image = image1
        }
        
        // create folder references로 추가한 폴더는 폴더 경로를 함께 사용
        if let image2 = UIImage(named: "images2/image2") {
            imageView2.image = image2
        }
    }
}

