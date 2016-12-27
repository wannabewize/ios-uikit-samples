//
// 코드로 제약조건 작성하기
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 제약조건을 작성하려면 뷰를 먼저 뷰 구조에 추가해야 한다.
        let label = UILabel()
        label.text = "Layout By Code"
        label.font = UIFont.systemFont(ofSize: 24)
        label.backgroundColor = UIColor.lightGray
        self.view.addSubview(label)
        
        // 오토 리사이즈로 인한 제약조건 생성 막기
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // 왼쪽으로 20 포인트 여백
        let leftConstraint = NSLayoutConstraint(item: label, attribute: NSLayoutAttribute.leading, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.leadingMargin, multiplier: 1.0, constant: 20)
        // 씬 상단 레이아웃 가이드와 20포인트 여백
        let topConstraint = NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.topLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 20)
        // 부모뷰에 제약조건 객체 추가
        label.superview!.addConstraints([leftConstraint, topConstraint])
        
        // 크기 제약조건
        let widthConstraint = NSLayoutConstraint(item: label, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 300)
        // 해당 뷰에 제약조건 추가
        label.addConstraint(widthConstraint)
        
        let label1 = UILabel()
        label1.text = "첫 번째 레이블"
        label1.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(label1)
        
        let label2 = UILabel()
        label2.text = "두 번째 레이블"
        label2.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(label2)
        
        label1.translatesAutoresizingMaskIntoConstraints = false
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        // 비주얼 포맷 언어에서 사용하는 뷰
        let views : [String:AnyObject] = ["label1":label1, "label2":label2, "topGuide":self.topLayoutGuide]
        // 비주얼 포맷 언어로 제약조건 객체 생성
        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat:"|-20-[label1]-20-[label2]", options:[], metrics: nil, views: views)
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:[topGuide]-100-[label1][label2]", options:[], metrics: nil, views: views)
        
        // 부모뷰에 제약조건 추가
        label.superview!.addConstraints(horizontalConstraints)
        label.superview!.addConstraints(verticalConstraints)
    }
}

