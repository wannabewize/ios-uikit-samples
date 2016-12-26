//
//  ViewController.swift
//  CodeAndView
//
//  Created by Jaehoon Lee on 2016. 12. 25..
//  Copyright © 2016년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 코드로 작성한 뷰. 뷰 컨트롤러 전체에서 접근하기 위해서 프로퍼티로 선언
    var redView : UIView!
    
    // 스토리보드에 작성하고 아웃렛으로 연결한 뷰
    @IBOutlet weak var greenView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        // 코드로 작성한 뷰 접근
        redView.backgroundColor = UIColor.yellow
        
        // 아웃렛으로 연결한 뷰 접근
        greenView.backgroundColor = UIColor.purple
        
        // 태그를 이용한 뷰 접근
        if let blueView = self.view.viewWithTag(99) {
            blueView.backgroundColor = UIColor.gray
        }
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRect(x: 20, y: 40, width: 200, height: 200)
        redView = UIView(frame:frame)
        redView.backgroundColor = UIColor.red
        self.view.addSubview(redView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

