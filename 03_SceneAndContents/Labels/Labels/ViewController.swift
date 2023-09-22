//
// 레이블을 이용한 문자 출력 예제
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label1 = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 40))
        label1.text = "일반 레이블"
        label1.textColor = UIColor.blue
        label1.font = UIFont.systemFont(ofSize: 15)
        self.view.addSubview(label1)
        
        let label2 = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 40))
        label2.text = "Marker Felt font Label"
        label2.font = UIFont(name: "Marker Felt", size: 20)
        self.view.addSubview(label2)
        
        // 크기는 0으로 설정. sizeToFit으로 맞추기
        let headlineLabel = UILabel(frame: CGRect(x: 50, y: 150, width: 0, height: 0))
        headlineLabel.text = "Headline Text Style"
        headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        // intrinsic size
        headlineLabel.sizeToFit()
        self.view.addSubview(headlineLabel)
        
        let lineBreakLabel = UILabel(frame: CGRect(x: 50, y: 200, width: 100, height: 40))
        lineBreakLabel.text = "View Size and Text Size"
        // 중간 축약
        lineBreakLabel.lineBreakMode = .byTruncatingMiddle
        lineBreakLabel.font = UIFont.systemFont(ofSize: 30)
        self.view.addSubview(lineBreakLabel)
        
        
        let autoshrinkLabel = UILabel(frame: CGRect(x: 50, y: 250, width: 100, height: 40))
        autoshrinkLabel.text = "Autoshrink Text"
        autoshrinkLabel.font = UIFont.systemFont(ofSize: 30)
        // 0.3배까지 폰트 크기 조정
        autoshrinkLabel.adjustsFontSizeToFitWidth = true
        autoshrinkLabel.minimumScaleFactor = 0.3
        self.view.addSubview(autoshrinkLabel)
        
        let multilineLabel = UILabel(frame: CGRect(x: 50, y: 300, width: 100, height: 80))
        multilineLabel.text = "여러 줄에 텍스트 출력하기"
        // 레이블의 높이가 허용하는 크기까지 여러줄로 출력
        multilineLabel.numberOfLines = 0
        self.view.addSubview(multilineLabel)
        
        // 속성 문자열
        let attributedStr = NSMutableAttributedString(string: "Attributed Text")
        // 속성 문자열의 속성 설정
        attributedStr.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 30), range: NSMakeRange(1, 3))
        let font = UIFont(name: "Marker Felt", size: 25)!
        attributedStr.addAttribute(NSAttributedString.Key.font, value: font, range: NSMakeRange(11, 4))
        attributedStr.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 25)], range: NSMakeRange(7, 3))
        // 레이블 생성과 속성 문자열 설정
        let attributedTextLabel = UILabel(frame: CGRect(x: 50, y: 400, width: 200, height: 40))
        attributedTextLabel.attributedText = attributedStr
        // 뷰 구조에 추가
        self.view.addSubview(attributedTextLabel)
        
        let customFontLabel = UILabel(frame: CGRect(x: 50, y: 450, width: 300, height: 40))
        customFontLabel.font = UIFont(name: "SeoulHangang", size: 25)
        customFontLabel.text = "커스텀 폰트를 사용한 레이블"
        self.view.addSubview(customFontLabel)
    }
}

