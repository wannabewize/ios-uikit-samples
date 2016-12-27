//
//  ViewController.swift
//  SegmentedControl
//
//  Created by Jaehoon Lee on 2016. 12. 28..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // png는 확장자 생략 가능, 옵셔널 체크 필요
        let rain = UIImage(named: "rain")!
        //    let rain2 = rain.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        let thunder = UIImage(named: "thunder")!
        let sun = UIImage(named: "sun")!
        
        // 배열
        let items = [rain, thunder, sun]
        
        let control = UISegmentedControl(items: items)
        control.frame = CGRect(x: 20, y: 200, width: 300, height: 40)
        self.view.addSubview(control)
        
        control.addTarget(self, action: #selector(handleSegmentChange(_:)), for: .valueChanged)
    }
    
    func handleSegmentChange(_ sender : Any) {
        let control = sender as! UISegmentedControl
        switch control.selectedSegmentIndex {
        case 0:
            print("소나기")
        case 1:
            print("천둥,번개")
        default:
            print("맑음")
        }
    }

}

