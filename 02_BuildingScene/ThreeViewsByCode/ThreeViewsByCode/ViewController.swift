//
//  ViewController.swift
//  ThreeViewsByCode
//
//  Created by Jaehoon Lee on 2016. 12. 20..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var redView : UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰의 위치와 크기 - 프레임으로 작성
        let frame = CGRect(x: 20, y: 40, width: 200, height: 200)
        redView = UIView(frame: frame)
        
        // 뷰의 배경은 빨간색
        redView.backgroundColor = UIColor.red
        redView.alpha = 0.6
        
        // 뷰 구조에 추가
        self.view.addSubview(redView)
        
        
        // 파란색 뷰 생성, 위치와 크기 설정, 뷰 구조에 추가
        let blueView = UIView()
        blueView.frame = CGRect(x: 100, y: 100, width: 200, height: 200)
        blueView.backgroundColor = UIColor(red: 0, green: 0, blue: 1.0, alpha: 0.7)
        self.view.addSubview(blueView)
        
        
        let greenView = UIView()
        self.view.addSubview(greenView)
        // 뷰의 위치와 크기
        greenView.frame.origin = CGPoint(x: 50, y: 200)
        greenView.frame.size = CGSize(width: 200, height: 200)
        greenView.backgroundColor = UIColor(colorLiteralRed: 0, green: 1, blue: 0, alpha: 0.7)
        greenView.alpha = 0.7
    }
}

