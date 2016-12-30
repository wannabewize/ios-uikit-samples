//
//  ViewController.swift
//  TouchAndGesture
//
//  Created by wannabewize on 2016. 12. 31..
//  Copyright © 2016년 VanillaStep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logs: UITextView!
    @IBOutlet weak var red: UIView!
    @IBAction func changeDelayTouchesBegan(_ sender: UISwitch) {
        gesture.delaysTouchesBegan = sender.isOn
        logs.text = "delays TouchesBegan : \(sender.isOn)"
    }
    
    @IBAction func changeDelaysTouchesEnded(_ sender: UISwitch) {
        gesture.delaysTouchesEnded = sender.isOn
        logs.text = "delays TouchesEnded : \(sender.isOn)"
    }
    
    @IBAction func changeCancelsTouchesInView(_ sender: UISwitch) {
        gesture.cancelsTouchesInView = sender.isOn
        logs.text = "cancels Touches : \(sender.isOn)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        logs.text = "touches began"
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        logs.text!.append("\ntouch moved")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        logs.text!.append("\ntouch ended")
    }
    
    @IBAction func clearLabel(_ sender: Any) {
        logs.text = ""
    }
    var gesture : UIPinchGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        red.isMultipleTouchEnabled = true
        
        logs.isEditable = false
        logs.isSelectable = false
        
        gesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        red.addGestureRecognizer(gesture)
        
    }

    func handlePinch(_ gesture : UIPinchGestureRecognizer) {
        logs.text = "Pinch Gesture"
        switch gesture.state {
        case .began:
            logs.text!.append("\nstate : began")
        case .changed:
            logs.text!.append("\nstate : changed")
        case .ended:
            logs.text!.append("\nstate : ended")
        default:
            break
        }
    }

}

