//
//  ViewController.swift
//  Gesture
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
        imageView.addGestureRecognizer(pinchGesture)
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotate(_:)))
        imageView.addGestureRecognizer(rotateGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        imageView.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        imageView.addGestureRecognizer(panGesture)
    }
    
    func handlePinch(_ gesture : UIPinchGestureRecognizer) {
        let scale = gesture.scale
        
        imageView.transform = imageView.transform.scaledBy(x: scale, y: scale)

        
        // 연속된 제스처 이벤트이므로 다시 초기화
        gesture.scale = 1.0
    }
    
    func handleTap(_ gesture : UITapGestureRecognizer) {
        let point = gesture.location(in: gesture.view)
        print("탭 좌표 : \(point)")
    }
    
    func handleRotate(_ gesture : UIRotationGestureRecognizer) {
        print("회전")
        let rotation = gesture.rotation
        imageView.transform = imageView.transform.rotated(by: rotation)
        
        // 연속된 제스처 이벤트이므로 초기화
        gesture.rotation = 0.0
    }
    
    func handlePan(_ gesture : UIPanGestureRecognizer) {
        let translation = gesture.translation(in: gesture.view!)
        imageView.transform = imageView.transform.translatedBy(x: translation.x, y: translation.y)
        // 초기화
        gesture.setTranslation(CGPoint.zero, in: gesture.view)
    }

}

