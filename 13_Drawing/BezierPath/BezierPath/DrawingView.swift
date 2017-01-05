//
//  DrawingView.swift
//  BezierPath
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class DrawingView: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.blue.setStroke()
        
        let path = UIBezierPath()
        
        
        path.lineWidth = 10
        path.lineCapStyle = .round
        
        path.move(to: CGPoint(x:20, y:20))
        path.addLine(to: CGPoint(x: 100, y: 100))
        path.addLine(to: CGPoint(x: 200, y: 20))
    
        path.stroke()
        
        // 파란선, 노란색 채우기
        UIColor.blue.setStroke()
        UIColor.yellow.setFill()
        
        // 사각형
        let rectPath = UIBezierPath(rect: CGRect(x: 100, y: 100, width: 150, height: 150))
        rectPath.stroke()
        
        // 둥근 사각형
        let roundRectPath = UIBezierPath(roundedRect: CGRect(x: 120, y: 120, width: 110, height: 110), cornerRadius: 10)
        // 선그리고 내부 칠하기
        roundRectPath.stroke()
        roundRectPath.fill()
        
        let endX = self.frame.size.width - 10
        
        let curve = UIBezierPath()
        curve.lineWidth = 10.0
        curve.move(to: CGPoint(x: 10, y: 300))
        curve.addQuadCurve(to: CGPoint(x: endX, y: 300),
                           controlPoint: CGPoint(x: 160, y: 200))
        
        curve.move(to: CGPoint(x: 10, y: 400))
        curve.addCurve(to: CGPoint(x: endX, y: 400),
                       controlPoint1: CGPoint(x: 100, y: 300),
                       controlPoint2: CGPoint(x: 200, y: 500))
        curve.stroke()
    }
}
