//
//  DrawingView.swift
//  TouchDrawing
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    
    var path = UIBezierPath()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: self)
        path.move(to: point)
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let point = touch.location(in: self)
        // 이동한 좌표까지 직선 그리기 경로 추가
        path.addLine(to: point)
        // 다시 그리기
        self.setNeedsDisplay()
        
    }
    override func draw(_ rect: CGRect) {
        path.stroke()
    }
}
