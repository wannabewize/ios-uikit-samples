//
//  ViewController.swift
//  ModalScene
//
//  Created by Jaehoon Lee on 2017. 1. 2..
//  Copyright © 2017년 vanillastep. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 코드로 세그웨이 동작시키기 - 세그웨이 연결된 상태에서만 동작
    @IBAction func showModal2(_ sender: Any) {
        self.performSegue(withIdentifier: "MODAL_SEGUE", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func showModal3(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier:"MODAL_VC") {
            self.present(vc, animated: true)
        }
    }

}

