//
//  ViewController.swift
//  ColorSlider
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    // 3색 슬라이더의 아웃렛 연결
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider.maximumValue = 1.0
        greenSlider.maximumValue = 1.0
        blueSlider.maximumValue = 1.0
    }
    
    // 파라미터가 필요없는 액션 메소드
    // 3색 슬라이더의 ValueChanged 이벤트와 연결
    @IBAction func colorChanged() {
        let r = redSlider.value
        let g = greenSlider.value
        let b = blueSlider.value
        let color = UIColor(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: 1)
        colorView.backgroundColor = color
    }
    
    // 스위치의 ValueChanged 이벤트와 연결
    @IBAction func switchChanged(_ sender: UISwitch) {
        redSlider.isEnabled = sender.isOn
        greenSlider.isEnabled = sender.isOn
        blueSlider.isEnabled = sender.isOn
        if sender.isOn {
            colorChanged()
        } else {
            colorView.backgroundColor = UIColor.gray
        }
    }
    
    // 씬이 나타나면서 기본 설정값 반영
    override func viewWillAppear(_ animated: Bool) {
        colorChanged()
    }

}

