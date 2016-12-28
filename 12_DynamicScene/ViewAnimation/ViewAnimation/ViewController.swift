//
//  ViewController.swift
//  ViewAnimation
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var block: UIView!
    
    @IBAction func moveBlock(_ sender: Any) {
        UIView.animate(withDuration: 1.0) { 
            let width = self.view.frame.size.width - self.block.frame.size.width
            let height = self.view.frame.height - self.block.frame.height - 44
            
            let x = arc4random_uniform(UInt32(width))
            let y = arc4random_uniform(UInt32(height))
            
            self.block.center = CGPoint(x : CGFloat(x), y: CGFloat(y))            
        }
    }
    
    @IBAction func scaleBlock(_ sender: Any) {
        UIView.animate(withDuration:1.0) {
            let length = arc4random_uniform(200) + 100
            
            self.block.frame.size = CGSize(width: CGFloat(length), height: CGFloat(length))
        }
    }
    
    @IBAction func animateMulti(_ sender: Any) {
        // do it!
        UIView.animate(withDuration: 1.0, animations: { 
            let width = self.view.frame.size.width - self.block.frame.size.width
            let height = self.view.frame.height - self.block.frame.height - 44
            
            let x = arc4random_uniform(UInt32(width))
            let y = arc4random_uniform(UInt32(height))
            
            self.block.center = CGPoint(x : CGFloat(x), y: CGFloat(y))
        }) { (finished : Bool) in
            
            UIView.animate(withDuration: 1.0, animations: { 
                let length = arc4random_uniform(200) + 100
                
                self.block.frame.size = CGSize(width: CGFloat(length), height: CGFloat(length));
            })
        }

    }


}

