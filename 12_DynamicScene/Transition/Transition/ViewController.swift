//
// 트랜지션 애니메이션 예제
// 임의의 색을 가진 뷰로 전환한다.
//

import UIKit

class ViewController: UIViewController {

    // 트랜지션이 발생하는 뷰 영역
    @IBOutlet weak var containerView: UIView!
    
    // 트랜지션 대상
    weak var currentView: UIView!
    
    
    // 초기 트랜지션이 되는 뷰
    override func viewDidLoad() {
        currentView = containerView.subviews[0]
    }
    
    // 트랜지션
    @IBAction func transition1(_ sender: Any) {
        guard currentView != nil else {
            print("currentView is nil")
            return
        }
        // 새로 전환할 뷰 생성
        let newView = UIView()
        newView.frame = currentView.frame
        
        let r = CGFloat.randomColorCode()
        let g = CGFloat.randomColorCode()
        let b = CGFloat.randomColorCode()
        
        newView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        // 뷰 전환
        UIView.transition(with:containerView, duration: 1.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
            
            self.currentView.removeFromSuperview()
            self.containerView.addSubview(newView)
            self.currentView = newView
            
        }) { (finished : Bool) -> Void in
            print("Transition Done");
        }
    }
    
    // Transition - API 2
    @IBAction func transition2() {
        guard currentView != nil else {
            print("currentView is nil")
            return
        }
        
        // 새로 전환할 뷰 생성
        let newView = UIView()
        newView.frame = currentView.frame
        
        let r = CGFloat.randomColorCode()
        let g = CGFloat.randomColorCode()
        let b = CGFloat.randomColorCode()
        
        newView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        UIView.transition(from: currentView, to: newView, duration: 1.0, options: .transitionFlipFromTop) { (finished) in
            self.currentView = newView
            print("Transition Done ", finished)
        }
    }
}

extension CGFloat {
    static func randomColorCode() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }
}

