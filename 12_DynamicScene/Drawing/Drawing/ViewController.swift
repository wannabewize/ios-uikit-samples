//
//  ViewController.swift
//  Drawing
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(self.view.frame)
        let mv = MyView(frame: self.view.frame)
        self.view.addSubview(mv)
        
        mv.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontals = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[mv]-0-|", options: [], metrics: nil, views: ["mv":mv])
        let verticals = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[mv]-0-|", options: [], metrics: nil, views: ["mv":mv])
        
        mv.superview!.addConstraints(horizontals)
        mv.superview!.addConstraints(verticals)                
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

