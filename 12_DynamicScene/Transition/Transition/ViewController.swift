//
//  ViewController.swift
//  Transition
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var currentView: UIView!
    
    @IBAction func startTransition(sender: AnyObject) {
        // 새로 전환할 뷰 생성
        let newView = UIView()
        newView.frame = currentView.frame
        
        let r = randomColorCode()
        let g = randomColorCode()
        let b = randomColorCode()
        
        newView.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        
        // 뷰 전환
        UIView.transition(with:containerView, duration: 1.0, options: UIViewAnimationOptions.transitionCrossDissolve, animations: { () -> Void in
            
            self.currentView.removeFromSuperview()
            self.containerView.addSubview(newView)
            self.currentView = newView
            
        }) { (finished : Bool) -> Void in
            
            print("Transition Done");
        }
        
        UIView.transition(from: currentView, to: newView, duration: 1.0, options: .transitionFlipFromTop) { (finished) in
            print("Transition Done")
        }
    }
    
    func randomColorCode() -> CGFloat {
        return CGFloat(arc4random_uniform(255)) / 255
    }

}

