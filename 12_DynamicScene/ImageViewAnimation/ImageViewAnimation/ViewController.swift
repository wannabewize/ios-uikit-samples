//
//  ViewController.swift
//  ImageViewAnimation
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var imageView : UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageView.animationImages
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

