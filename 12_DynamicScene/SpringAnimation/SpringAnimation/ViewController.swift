//
//  ViewController.swift
//  SpringAnimation
//
//  Created by wannabewize on 2017. 2. 10..
//  Copyright © 2017년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    @IBAction func startAnimation(_ sender: Any) {
        let y = self.view.frame.size.height - 100
        UIView.animate(withDuration: 1) { 
            self.redView.center.y = y
        }
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseIn], animations: { 
            self.redView.center.y = y
        }) { (finished : Bool) in
            print("Finish Animation1")
        }
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1.5, initialSpringVelocity: 1, options: [], animations: {
            self.blueView.center.y = y
        }) { (finished : Bool) in
            print("Finish Animation2")
        }
    }
    
    @IBAction func resetViews(_ sender: Any) {
        self.view.setNeedsLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

