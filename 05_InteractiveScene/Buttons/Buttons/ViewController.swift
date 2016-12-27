//
//  ViewController.swift
//  Buttons
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var textButton : UIButton!
    var imageButton : UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let infoButton = UIButton(type: UIButtonType.infoLight)
        // 시스템 버튼 크기는 미리 정해져있다.
        infoButton.center = CGPoint(x: 50, y: 150)
        self.view.addSubview(infoButton)
        
        // 커스텀 버튼
        textButton = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        print("button type : \(textButton.buttonType.rawValue)")
        // 보통 상태의 글자와 글자색
        textButton.setTitle("글자 버튼", for: UIControlState.normal)
        textButton.setTitleColor(UIColor.black, for: .normal)
        
        // 터치 상태의 글자와 글자색
        textButton.setTitle("터치중", for: .highlighted)
        textButton.setTitleColor(UIColor.red, for: .highlighted)
        // 버튼을 뷰에 추가
        self.view.addSubview(textButton)
        
        // 버튼 타입 지정하며 생성
        imageButton = UIButton(type: UIButtonType.custom)
        imageButton.frame = CGRect(x: 50, y: 200, width: 100, height: 50)
        
        // 보통 상태의 이미지
        let normalImage = UIImage(named: "like_button.png")
        imageButton.setImage(normalImage, for: .normal)
        
        // 사용할 수 없을 때의 이미지
        let disabledImage = UIImage(named: "like_button_disabled.png")
        imageButton.setImage(disabledImage, for: .disabled)
        
        self.view.addSubview(imageButton)
    }

    override func viewDidAppear(_ animated: Bool) {
        // 사용 불가로 변경
        imageButton.isEnabled = false
    }
}

