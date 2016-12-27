//
//  ViewController.swift
//  DatePickerTimer
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer : Timer!
    @IBOutlet weak var pickerView: UIDatePicker!
    
    @IBAction func startTimer(sender: AnyObject) {
        let interval : TimeInterval = 1
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(countDown(_:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(sender: AnyObject) {
        if timer != nil {
            timer.invalidate()
            timer = nil
        }
    }
    func countDown(_ timer : Timer) {
        pickerView.countDownDuration -= 60
    }
}

