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

    @IBAction func startAnimation(_ sender: Any) {
        imageView.startAnimating()
    }
    
    @IBAction func stopAnimation(_ sender: Any) {
        if imageView.isAnimating {
            imageView.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let images = [
            UIImage(named: "0.png")!,
            UIImage(named: "1.png")!,
            UIImage(named: "2.png")!,
            UIImage(named: "3.png")!,
            UIImage(named: "4.png")!,
            UIImage(named: "5.png")!,
            UIImage(named: "6.png")!,
            UIImage(named: "7.png")!,
            UIImage(named: "8.png")!,
            UIImage(named: "9.png")!
        ]
        
        imageView.animationImages = images
        imageView.animationDuration = 3
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

