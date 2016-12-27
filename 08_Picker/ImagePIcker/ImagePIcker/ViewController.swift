//
//  ViewController.swift
//  ImagePIcker
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerView: UIPickerView!
    // 공백 배열
    var data = [UIImage]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    // 이미지 뷰를 피커뷰에 제공
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = data[row]
        let itemView : UIImageView = UIImageView(image: image)
        return itemView
    }
    
    @IBAction func selectRandom(_ sender: AnyObject) {
        // 난수 발생
        let r = Int(arc4random()) % data.count
        // 피커에서 선택
        pickerView.selectRow(r, inComponent: 0, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 이미지 배열
        data = [UIImage(named:"img0")!,
                UIImage(named:"img1")!,
                UIImage(named:"img2")!,
                UIImage(named:"img3")!,
                UIImage(named:"img4")!,
                UIImage(named:"img5")!,
                UIImage(named:"img6")!]
    }
}

