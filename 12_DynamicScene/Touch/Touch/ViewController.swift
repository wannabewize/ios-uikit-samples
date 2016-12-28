//
//  ViewController.swift
//  Touch
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
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
    }
}

