//
//  ViewController.swift
//  FallingBlocks
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

extension UIColor {
    static func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(255)) / 255
        let g = CGFloat(arc4random_uniform(255)) / 255
        let b = CGFloat(arc4random_uniform(255)) / 255
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

class ViewController: UIViewController {
    
    var animator : UIDynamicAnimator!
    var gravityBehavior : UIGravityBehavior!
    var collisionBehavior : UICollisionBehavior!
    
    // 탭 동작 - 뷰 생성 - 중력과 충돌 효과 주기
    func handleTap(_ gesture : UITapGestureRecognizer) {
        // 전체 뷰에서 좌표 구하기
        let point = gesture.location(in: self.view)
        // 터치한 좌표위 상단에서 블럭 생성
        let item = UIView(frame: CGRect(x : point.x + 50, y : 70, width : 100, height : 100))
        
        // 임의의 색
        item.backgroundColor = UIColor.randomColor()
        
        self.view.addSubview(item)
        
        // 중력 효과
        gravityBehavior.addItem(item)
        // 충돌 효과
        collisionBehavior.addItem(item)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 애니메이터 생성
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // 중력 Behavior 추가
        gravityBehavior = UIGravityBehavior()
        animator.addBehavior(gravityBehavior)
        
        // 충동 Behavior 추가
        collisionBehavior = UICollisionBehavior()
        // Rererence 뷰의 경계면을 충돌 영역으로 지정
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collisionBehavior)

        // 탭 제스처 인식기 추가
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.view.addGestureRecognizer(tapGesture)
    }
}

