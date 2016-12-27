//
// 코드를 이용한 버튼과 액션 다루기
//

import UIKit

class ViewController: UIViewController {
    
    var colorView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView = UIView()
        colorView.backgroundColor = UIColor.gray
        self.view.addSubview(colorView)
        
        //    colorView.frame = CGRectMake(20, 80, self.view.frame.size.width - 40, self.view.frame.size.height - 100)
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        // 가로 제약조건
        let constraint1 = NSLayoutConstraint.constraints(withVisualFormat: "|-20-[colorView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["colorView":colorView])
        // 세로 제약조건
        let constraint2 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-80-[colorView]-20-|", options: NSLayoutFormatOptions(rawValue: 0), metrics: nil, views: ["colorView":colorView])
        self.view.addConstraints(constraint1)
        self.view.addConstraints(constraint2)
        
        // 버튼 배치
        let button1 = UIButton()
        button1.setTitle("Red", for: .normal)
        button1.setTitleColor(UIColor.red, for: .normal)
        self.view.addSubview(button1)
        
        let button2 = UIButton()
        button2.setTitle("Green", for: .normal)
        button2.setTitleColor(UIColor.green, for: .normal)
        self.view.addSubview(button2)
        
        let button3 = UIButton()
        button3.setTitle("Blue", for: .normal)
        button3.setTitleColor(UIColor.blue, for: .normal)
        self.view.addSubview(button3)
        
        // 버튼 1,2,3의 제약조건
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        let constraintViews = ["button1":button1, "button2":button2, "button3":button3]
        
        // 버튼2 중앙 - 비주얼 포맷 언어로는 힘들다.
        let constraint3 = NSLayoutConstraint(item: button2, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: button2.superview, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0)
        // 버튼2 세로
        let constraint4 = NSLayoutConstraint.constraints(withVisualFormat: "V:|-40-[button2]", options:[], metrics: nil, views: constraintViews)
        
        // 버튼1,2,3의 거리
        let constraint5 = NSLayoutConstraint.constraints(withVisualFormat: "[button1]-60-[button2]-60-[button3]", options:NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: constraintViews)
        
        self.view.addConstraint(constraint3)
        self.view.addConstraints(constraint4)
        self.view.addConstraints(constraint5)
        
        button1.addTarget(self, action: #selector(changeRed(_:)), for: UIControlEvents.touchUpInside)
        // 문자열로 셀랙터 대체
        button2.addTarget(self, action: #selector(changeGreen(_:)), for: UIControlEvents.touchUpInside)
        button3.addTarget(self, action: #selector(changeBlue), for: UIControlEvents.touchUpInside)
    }
    
    func changeRed(_ sender : Any) {
        colorView.backgroundColor = UIColor.red
    }
    
    // sender는 버튼 객체이므로 파라미터 타입을 UIButton으로 선언할 수 있다.
    func changeGreen(_ sender : UIButton) {
        colorView.backgroundColor = UIColor.green
    }
    
    // 파라미터 없이 사용 가능
    func changeBlue() {
        colorView.backgroundColor = UIColor.blue
    }

}

