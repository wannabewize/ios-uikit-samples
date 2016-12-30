//
//  ViewController.swift
//  DynamicsAttachment
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var block1 : UIView!
    var block2 : UIView!
    
    var animator : UIDynamicAnimator!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        block1 = UIView(frame: CGRect(x:20, y:20, width:100, height:100))
        block1.backgroundColor = UIColor.red
        self.view.addSubview(block1)
        
        block2 = UIView(frame: CGRect(x:100, y:100, width:100, height:100))
        block2.backgroundColor = UIColor.blue
        self.view.addSubview(block2)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        // block2(Blue)가 block1(Red)에 연결
        let attachment = UIAttachmentBehavior(item: block2, attachedTo: block1)
        
        attachment.length = 200
        attachment.damping = 10
        attachment.frequency = 60
        
        animator.addBehavior(attachment)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        block1.addGestureRecognizer(panGesture)
    }
    
    func handlePan(_ gesture : UIPanGestureRecognizer) {
        // 전체 뷰에서 터치된 좌표 얻기
        let point = gesture.location(in: self.view)
        block1.center = point
        
        animator.updateItem(usingCurrentState: block1)
    }
}

