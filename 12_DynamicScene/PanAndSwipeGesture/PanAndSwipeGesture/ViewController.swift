//
//  ViewController.swift
//  PanAndSwipeGesture
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var red: UIView!
    
    var pan : UIPanGestureRecognizer!
    var swipe : UISwipeGestureRecognizer!
    
    @IBAction func switchPanGesture(_ sender: UISwitch) {
        if sender.isOn {
            pan = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
            red.addGestureRecognizer(pan)
            label.text = "Pan gesture recognized added"
        }
        else {
            red.removeGestureRecognizer(pan)
            label.text = "Pan gesture recognized removed"
            pan = nil
        }
    }
    
    @IBAction func switchSwipeGesture(_ sender: UISwitch) {
        if sender.isOn {
            swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
            red.addGestureRecognizer(swipe)
            label.text = "Swipe gesture recognized added"
        }
        else {
            red.removeGestureRecognizer(swipe)
            label.text = "Swipe gesture recognized removed"
            swipe = nil
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func handlePan(_ gesture : UIPanGestureRecognizer) {
        label.text = "Pan Gesture"
        
        switch gesture.state {
        case .began:
            label.text!.append("\nstate : Began")
        case .changed:
            label.text!.append("\nstate : changed")
            let translate = gesture.translation(in: gesture.view)
            label.text!.append("\ntranslate : \(translate.x), \(translate.y)")
            let velocity = gesture.velocity(in: gesture.view)
            label.text!.append("\nvelocity : \(velocity)")
        case .ended:
            label.text!.append("\nstate : Ended")
        default :
            label.text!.append("\nstate : etc")
        }
    }
    
    func handleSwipe(_ gesture : UISwipeGestureRecognizer) {
        label.text = "Swipe Gesture"
        
        switch gesture.state {
        case .began:
            label.text!.append("\nstate : Began")
        case .changed:
            label.text!.append("\nstate : changed")
        case .ended:
            label.text!.append("\nstate : Ended")
        default :
            label.text!.append("\nstate : etc")
        }
    }

}

