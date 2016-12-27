//
//  ViewController.swift
//  NumberChange
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 레이블 아웃렛
    @IBOutlet weak var label: UILabel!
    // 슬라이더 아웃렛
    @IBOutlet weak var slider: UISlider!
    // 스테퍼 아웃렛
    @IBOutlet weak var stepper: UIStepper!
    
    // 스테퍼 변경
    @IBAction func stepperChanged(_ sender: AnyObject) {
        let v = Int(stepper.value)
        label.text = "\(v)"
        slider.value = Float(v)
    }
    
    // 슬라이더 변경
    @IBAction func sliderChanged(_ sender: AnyObject) {
        let v = Int(slider.value)
        label.text = "\(v)"
        slider.value = Float(v)
        stepper.value = Double(v)
    }
}

