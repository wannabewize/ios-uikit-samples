//
//  ViewController.swift
//  BezierPath
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dv = DrawingView()
        self.view.addSubview(dv)
        dv.backgroundColor = UIColor.white
        
        dv.translatesAutoresizingMaskIntoConstraints = false
        
        let horizontals = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[dv]-0-|", options: [], metrics: nil, views: ["dv":dv])
        let verticals = NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[dv]-0-|", options: [], metrics: nil, views: ["dv":dv])
        
        self.view.addConstraints(horizontals)
        self.view.addConstraints(verticals)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

