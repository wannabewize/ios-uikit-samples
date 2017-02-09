//
//  MyView.swift
//  Drawing
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class MyView: UIView {
    //
    // Initializer
    // 스토리보드에서 뷰가 생성될 때 동작
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 코드로 init(frame:)로 생성할 때 동작
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    // 레이아웃 되는 시점에 동작
    override func layoutSubviews() {
        print("layout Subview")
        // 다시 그리기
        setNeedsDisplay()
    }
    
    // AddSubview되고 나서 동작
    override func didAddSubview(_ subview: UIView) {
        print("view added")
    }
    
    override func draw(_ rect: CGRect) {
        print("draw rect works")
        let str = "글자 그리기"
        
        let attr = [NSForegroundColorAttributeName:UIColor.red,
                    NSFontAttributeName:UIFont.systemFont(ofSize: 30)]
        
        (str as NSString).draw(at: CGPoint(x:10, y:10), withAttributes: attr)
        
        if let image = UIImage(named: "image.jpg") {
            image.draw(in: CGRect(x: 10, y: 50, width: image.size.width, height: image.size.height))
        }
    }
}
